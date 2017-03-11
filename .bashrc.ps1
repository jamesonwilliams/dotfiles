
reset="\[$(tput sgr0)\]"
bold="\[$(tput bold)\]"
gray="245"

directory='\w'
host='\h'
user='\u'

function get_color_for_host() {
    unique_id=$(hostname -s | cksum | cut -f1 -d" ")
    host_color=$(($(($unique_id % 130)) + 50))

    echo "$host_color"
}

function colorize() {
    target="$1"
    color="${2-$(get_color_for_host)}"

    echo -n "\[$(tput setaf $color)\]${target}${reset}"
}

PS1="${user}@"
PS1="${PS1}${bold}$(colorize ${host}):"
PS1="${PS1}$(colorize $directory $gray)$ "
PS1="${PS1}${reset}"

export PS1

