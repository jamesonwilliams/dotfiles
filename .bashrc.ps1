[ -z "$term_reset" ] &&
    readonly term_reset="\[$(tput sgr0)\]"

get_color_for_host() {
    local readonly unique_id=$(hostname -s | cksum | cut -f1 -d" ")
    local readonly host_color=$(($(($unique_id % 130)) + 40))

    echo "$host_color"
}

colorize() {
    # Note: you want `tput setaf` to work so bad, but it just doesn't.
    local readonly color_format="\[\033[38;5;%dm\]"

    local readonly default_color="$(get_color_for_host)"
    local readonly target="$1"
    local readonly color="${2-$default_color}"

    printf "${color_format}${target}${term_reset}" "$color"
}

build_ps1() {
    local readonly bold="\[$(tput bold)\]"
    local readonly gray="245"

    local readonly directory='\w'
    local readonly host='\h'
    local readonly user='\u'

    local prompt=''

    prompt="${user}@"
    prompt="${prompt}${bold}$(colorize ${host}):"
    prompt="${prompt}$(colorize $directory $gray)$ "
    prompt="${prompt}${term_reset}"
    
    echo -n "${prompt}"
}

export PS1="$(build_ps1)"
