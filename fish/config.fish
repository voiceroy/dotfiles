if status is-interactive
    set -gx GPG_TTY (tty)
    fish_ssh_agent
end

if status is-login
    exec bash -c "test -e /etc/profile && source /etc/profile;\
    exec fish"
end
