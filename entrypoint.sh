#!/bin/bash
set -e

export APPLICATION_SECRET="${APPLICATION_SECRET:-$(LC_ALL=C tr -dc [:alnum:] < /dev/urandom | head -c 64)}"
CMAK_ARGS=$(echo ${CMAK_ARGS} | xargs)

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- /app/bin/cmak ${CMAK_ARGS} "${@}"
fi

exec "$@"