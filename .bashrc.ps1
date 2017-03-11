
reset="$(tput sgr0)"

base="\e[38;5;"
gray="${base}245m"

directory='\w'
host='\h'
user='\u'

function get_color_for_host() {
    unique_id=$(hostname -s | cksum | cut -f1 -d" ")
    host_color=$(($(($unique_id % 200)) + 28))

    echo "${base}${host_color}m"
}

function colorize() {
    target="$1"
    color="${2-$(get_color_for_host)}"

    echo -n "${color}${target}${reset}"
}

export PS1="${user}@$(colorize $host):$(colorize $directory $gray)\\$ "

