#!/bin/sh
set -e
cd $(dirname $0)

LABELS="${LABELS:-docker}"
EXECUTORS="${EXECUTORS:-8}"
FSROOT="${FSROOT:-/tmp/jenkins}"

mkdir -p $FSROOT
java -jar slave.jar -labels $LABELS -executors $EXECUTORS -fsroot $FSROOT \
  -name docker-$(hostname) -master $JENKINS_ADDR -username $JENKINS_USER -password $JENKINS_PASS
