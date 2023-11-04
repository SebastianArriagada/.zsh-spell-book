_tm.getCurrenSession() tmux display-message -p '#S'

tm() {
  local targetSession=$1
  if [[ -z "$targetSession" ]]; then
    targetSession=`tmux display-message -p '#S'` # last session
    : ${targetSession:='main'}
  fi

  # if outside tmux
  [[ -z "$TMUX" ]] && tmux new -A -s $targetSession && return $?

  [[ "`_tm.getCurrenSession`" = "$targetSession" ]] && \
    ${zsb}.throw 'You did not move.'

  # Create session if it doesn't exists
  tmux new -d -s $targetSession 2>/dev/null

  tmux switch-client -t $targetSession
}

_${zsb}.tm() {
  (( $CURRENT > 2 )) && return 0

  local tmuxList=( `tmls` )

  # if outside tmux
  [[ -z "$TMUX" ]] &&  _describe 'command' tmuxList && return 0

  local currentSession=( `_tm.getCurrenSession` )
  local actualList=(${tmuxList:|currentSession})
  _describe 'command' actualList
}

hisIgnore tm

compdef _${zsb}.tm tm

alias TM="toggleCapsLock && tm"

