getRepoName() {
  local pathToDotGit=`git rev-parse --git-dir 2>/dev/null`
  [[ -z "$pathToDotGit" ]] && return 0

  if [[ "$pathToDotGit" = ".git" ]]; then
    printf ${PWD##*/}; return $?
  fi

  local tail=${pathToDotGit##*/}
  if [[ "$tail" != ".git" ]]; then
    printf "$tail"; return $?
  fi

  local parentRootDir=`dirname ${pathToDotGit}`
  printf ${parentRootDir##*/}
}
