export EDITOR='subl'
export GIT_EDITOR='subl -w'

# # Invoke GnuPG-Agent the first time we login.
# # Does `~/.gpg-agent-info' exist and points to gpg-agent process accepting signals?
# if test -f $HOME/.gpg-agent-info && \
#     kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
#     GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info | cut -c 16-`
# else
#     # No, gpg-agent not available; start gpg-agent
#     eval `gpg-agent --daemon --no-grab --write-env-file $HOME/.gpg-agent-info`
# fi
# export GPG_TTY=`tty`
# export GPG_AGENT_INFO

# In order for gpg to find gpg-agent, gpg-agent must be running, and there must be an env
# variable pointing GPG to the gpg-agent socket. This little script, which must be sourced
# in your shell's init script (ie, .bash_profile, .zshrc, whatever), will either start
# gpg-agent or set up the GPG_AGENT_INFO variable if it's already running.

# Add the following to your shell init to set up gpg-agent automatically for every shell
if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi
