#!/bin/bash
# See doc/developers.adoc for purposes of this script

# Got to the root of project (where this script itself is located)
cd `dirname "$0"`

# Determine sub-type
RUNTIME=""
if [[ $1 == "runtime" ]]; then
  RUNTIME="runtime_"
  cd runtime
  shift
fi

if [[ $# -lt 2 ]]; then
  echo "Updates submodule in the project to you fork"
  echo "See doc/developers.adoc or https://doc.kaitai.io/developers.html#_developing_new_feature"
  echo "Usage:"
  echo "  $0 [runtime] <PROJECT> <GitHub user> [<branch in you GitHub repository>]"
  exit 2
fi

PROJECT=$1
GH_USER=$2
BRANCH=$3
URL="https://github.com/${GH_USER}/kaitai_struct_${RUNTIME}${PROJECT}.git"

BRANCH_TITLE="${BRANCH}"
if [[ "${BRANCH}" -eq "" ]]; then
  BRANCH_TITLE="<all>"
fi

echo "Project    : ${PROJECT}"
echo "GitHub User: ${GH_USER}"
echo "Branch     : ${BRANCH_TITLE}"
echo "Repository : ${URL}"
echo `pwd`

# Select subproject you want to modify
cd ${PROJECT}
# Add your repository as remote with name my-repo
git remote add ${GH_USER} ${URL}

if [[ "${BRANCH}" -eq "" ]]; then
  # Get you work
  git fetch ${GH_USER}
else
  # Get you work
  git fetch ${GH_USER} ${BRANCH}
  # Switch to you feature branch
  git checkout ${BRANCH}
fi
