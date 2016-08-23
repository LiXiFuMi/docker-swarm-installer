#!/bin/bash

# author: Julen Lizaso
# email: lixifumi@gmail.com

VERSION="0.0.1"
LOGDIR="log"
DRIVERDIR="driver"

function header {
  echo ""
  echo "Docker Swarm installer"
  echo "Version ${VERSION}"
  echo "by Julen Lizaso <lixifumi@gmail.com>"
  echo ""
}

function drivers {
  echo "Available drivers:"
  for d in `ls ${DRIVERDIR}`; do
    echo "-> ${d}"
  done
}

function select-driver {
  echo -n "Select driver: "
  read DRIVER
  if [ ! -f ${DRIVERDIR}/${DRIVER} ]; then
    echo "No driver available"
    echo "Exiting..."
    exit 1
  fi
  source ${DRIVERDIR}/${DRIVER}
  driver-header
}

mkdir -p log

header
drivers
select-driver
