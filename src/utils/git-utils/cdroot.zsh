cdroot() {
  local pathToDotGit=`git rev-parse --git-dir 2>/dev/null`
  [[ -n "$pathToDotGit" ]] && cd `dirname ${pathToDotGit}`
}