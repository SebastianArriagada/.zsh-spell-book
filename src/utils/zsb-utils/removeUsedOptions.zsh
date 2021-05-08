${zsb}.removeUsedOptions() {
  local inputUsedOptions=(`echo ${1}`)
  local completionList=(`echo ${2}`)

  # copy inputUsedOptions into an associative array
  declare -A usedOptions=( )
  for item in "${inputUsedOptions[@]}"; do
    usedOptions[$item]=1
  done

  # create a new completion list excluding usedOptions
  local newCompletionList=( )
  for item in "${completionList[@]}"; do
    [ "${usedOptions[$item]}" == "1" ] && continue
    newCompletionList+=( "$item" )
  done

  echo ${newCompletionList[@]}
}
