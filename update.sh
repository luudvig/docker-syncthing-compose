#!/usr/bin/bash

{
  set -e
  cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

  /usr/bin/docker compose pull --quiet
  /usr/bin/docker compose down

  /usr/bin/tar --create --file=update.tgz --gzip --verbose data-*/

  /usr/bin/docker compose up --detach
} &> "${BASH_SOURCE[0]%.*}.log"
