# opts
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=5000                    # Maximum events for internal history
SAVEHIST=5000                    # Maximum events in history file

setopt appendhistory             # Append rather than overwrite
setopt share_history             # Share history between all sessions.
setopt hist_ignore_space         # Do not record an event starting with a space.
setopt hist_expire_dups_first    # Expire a duplicate event first when trimming history.
setopt hist_ignore_dups          # Do not record an event that was just recorded again.
setopt hist_ignore_all_dups      # Delete an old recorded event if a new event is a duplicate.
setopt hist_find_no_dups         # Do not display a previously found event.
setopt hist_save_no_dups         # Do not write a duplicate event to the history file.
setopt hist_verify               # Do not execute immediately upon history expansion.

