#!/usr/bin/env zsh
set -o errexit
set -o nounset
set -o pipefail

declare -Ar SPANISH_CHARACTERS=(
  [a\ =\>\ á]='á'
  [e\ =\>\ é]='é'
  [i\ =\>\ í]='í'
  [o\ =\>\ ó]='ó'
  [u\ =\>\ ú]='ú'
  [n\ =\>\ ñ]='ñ'

  [A\ =\>\ Á]='Á'
  [E\ =\>\ É]='É'
  [I\ =\>\ Í]='Í'
  [O\ =\>\ Ó]='Ó'
  [U\ =\>\ Ú]='Ú'
  [N\ =\>\ Ñ]='Ñ'
)

declare -r selection=$(print -l "${(@k)SPANISH_CHARACTERS}" | rofi ${(z)commonRofiProps} -width -8 -auto-select -p "")

[[ -z "$selection" ]] && exit 0

echo "${SPANISH_CHARACTERS[$selection]}" | xclip -r -selection clipboard && xdotool key shift+Insert

exit 0

