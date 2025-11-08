if status is-interactive
    # Commands to run in interactive sessions can go here
    pfetch
end

function fish_prompt
    # Определяем информацию о дистрибутиве
    set distro_info "Unknown"
    set distro_version ""
    set -U fish_greeting ""
    
    if test -f /etc/os-release
        set distro_name (cat /etc/os-release | grep -E '^NAME=' | cut -d= -f2 | tr -d '"')
        set distro_version (cat /etc/os-release | grep -E '^VERSION=' | cut -d= -f2 | tr -d '"')
        set distro_info "$distro_name $distro_version"
    else if test -f /etc/redhat-release
        set distro_info (cat /etc/redhat-release)
    end

    # Первая строка: пользователь
    set_color brblue
    echo -n '[user] '
    set_color -o green
    echo -n '-=> '
    set_color yellow
    echo (whoami)
    
    # Вторая строка: дистрибутив
    set_color brblue
    echo -n '[дистрибутив] '
    set_color -o green
    echo -n '-=> '
    set_color yellow
    echo $distro_info
    
    # Третья строка: директория
    set_color brblue
    echo -n '[директория] '
    set_color -o green
    echo -n '-=> '
    set_color yellow
    echo (pwd)
    
    # Четвертая строка: приглашение для ввода
    set_color -o green
    echo -n '-=> '
    set_color normal
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end
