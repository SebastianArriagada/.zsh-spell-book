# ghpr.my-repo-folder() <<< "--title 'Pr title' --body 'some body to love'"

createPr_defaultProps="--title WIP --body WIP"

createPr() {
  ${zsb}.validateGitRepo
  local parentBranch=${1:="$(parentBranch)"}

  if ${zsb}.userWorkingOnDefaultBranch; then
    ${zsb}.throw "Can't create a pull request on a default branch, use `hl --aware` flag to do it anyway"
  fi

  [[ -z "$parentBranch" ]] && ${zsb}.throw "Couldn't retrieve parent branch info. Pass it manually"

  ${zsb}.confirmMenu.warning "Pull request to `hl ${parentBranch}` from `hl $(git branch --show-current)`"

  local propsGetter="ghpr.`getRepoName`"
  local restOfProps
  if type "$propsGetter" > /dev/null; then
    restOfProps=`${propsGetter}`
  else
    restOfProps="$createPr_defaultProps"
  fi

  gh pr create --draft --base "$parentBranch" ${(z)restOfProps}
  gh pr view --web
}

compdef _git createPr=git-branch
