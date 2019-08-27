tui enable
set confirm off
# set pagination off
# set verbose on

set breakpoint pending on
b main

set output-radix 10.

# These make gdb never pause in its output
set height 0
set width 0

# Async output
# set exec-done-display on 

set extended-prompt (gdb) 
set print pretty on
set print array on
set print array-indexes on
set print union on
set print demangle on
set follow-fork-mode child 

#define hook-next
#    refresh
#end

