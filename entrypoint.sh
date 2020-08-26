#!/bin/bash
set -e

export APPLICATION_SECRET="${APPLICATION_SECRET:-$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c 64)}"

if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ]; then
  set -- /app/bin/cmak "${CMAK_ARGS}" "${@}"
fi

exec "$@"