if status is-interactive
    set -gx GPG_TTY (tty)
    fish_ssh_agent
end

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec sway
    end
    exec bash -c "test -e /etc/profile && source /etc/profile;\
    exec fish"
end
