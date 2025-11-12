#!/usr/bin/env bash
set -euo pipefail

usage() {
    cat <<'EOF'
Usage: check_fs_space.bash [-p path] [-n entries] [-d depth] [path [entries]]

Display the largest directories/files (in kilobytes) for quick disk-usage triage.

Options:
  -p path     Path to analyze (default: current directory). Positional path works too.
  -n entries  How many rows to show (default: 20). Positional entries works too.
  -d depth    Maximum directory depth to inspect (default: 2).
  -h          Show this help text.
EOF
}

path="."
entries=20
max_depth=2

while getopts ":p:n:d:h" opt; do
    case "$opt" in
        p) path="$OPTARG" ;;
        n) entries="$OPTARG" ;;
        d) max_depth="$OPTARG" ;;
        h) usage; exit 0 ;;
        \?) echo "Invalid option: -$OPTARG" >&2; usage; exit 1 ;;
        :) echo "Option -$OPTARG requires an argument." >&2; usage; exit 1 ;;
    esac
done
shift $((OPTIND - 1))

if [[ $# -ge 1 ]]; then
    path="$1"
fi
if [[ $# -ge 2 ]]; then
    entries="$2"
fi

if [[ ! -e "$path" ]]; then
    echo "Path not found: $path" >&2
    exit 1
fi

if ! command -v perl >/dev/null 2>&1; then
    echo "perl is required for rendering output." >&2
    exit 1
fi

re_number='^[0-9]+$'
if ! [[ "$entries" =~ $re_number ]]; then
    echo "Entries must be a positive integer (given: $entries)" >&2
    exit 1
fi
if ! [[ "$max_depth" =~ $re_number ]]; then
    echo "Depth must be a positive integer (given: $max_depth)" >&2
    exit 1
fi

ionice_cmd=()
if command -v ionice >/dev/null 2>&1; then
    ionice_cmd=(ionice -c 3)
fi

du_cmd=(du -k -x)
du_cmd+=(-d "$max_depth" "$path")

if ((${#ionice_cmd[@]})); then
    du_cmd=("${ionice_cmd[@]}" "${du_cmd[@]}")
fi

"${du_cmd[@]}" \
    | sort -n \
    | perl -ne '
        if (/^(\d+)\s+(.*)$/) {
            my ($size, $name) = ($1, $2);
            my $log = log($size + 0.1);
            my $unit_index = int($log / log(1024));
            my @units = qw(K M G T P);
            $unit_index = $#units if $unit_index > $#units;
            my $human = $size / (2 ** (10 * $unit_index));
            my $bar = "*" x int(1.5 * $log);
            printf("%8.1f %s\t%-40s %s\n", $human, $units[$unit_index], $bar, $name);
        }
    ' \
    | tail -n "$entries"
