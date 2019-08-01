#!/bin/bash
set -x
set -e

CWD=$(dirname $0)/

if [ -z "$1" ]
then
    echo "Use to debug 'g <binary>'"
    exit 1
fi

binary=$1
echo $PWD

if [[ ! (-p ${CWD}temp_for_gdb) ]]; then
    mkfifo ${CWD}temp_for_gdb
fi

if [[ ! (-p ${CWD}pid_of_gterm) ]]; then
    mkfifo ${CWD}pid_of_gterm
fi

gnome-terminal --geometry 106x10 -- ${CWD}script "$PWD" &

tty_pts=$(cat ${CWD}temp_for_gdb)
pid=$(cat ${CWD}pid_of_gterm)

unlink ${CWD}temp_for_gdb
unlink ${CWD}pid_of_gterm
shift

gdb -nh -command=${CWD}gdbinit -q -tty=$tty_pts --tui -ex run --args $binary $*

kill $pid

exit

