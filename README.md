# gdb-easy
To start inferior of gdb in another window with input and output controlled by that terminal

all three files 'g','script' and 'gdbinit' should be in the same folder
'g','script' should be executable, if not use
```sh
chmod +x g
chmod +x script
```

Usage:
```sh
./g <binary to debug> <cmdline args>
```

To-Do:
  include 'script' into 'g'(basically remove the neccessity of seperate file)
