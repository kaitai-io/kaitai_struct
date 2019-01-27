#!/bin/sh -ef

# https://gitlab.com/kaitaiStructCompile.py/kaitai_struct_python_docker
# build depends on fresh unstable .deb being published. This call
# triggers GitLab CI pipeline that will build a new Docker image
# including latest unstable compiler build .deb.

echo Triggering build for kaitai_struct_python_docker project
if [ -n "$KAITAI_STRUCT_PYTHON_DOCKER_TOKEN" ]; then
	curl -F "token=${KAITAI_STRUCT_PYTHON_DOCKER_TOKEN}" -F "ref=master" https://gitlab.com/api/v4/projects/10444125/trigger/pipeline || true
fi
