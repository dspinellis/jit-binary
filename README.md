# jit-binary
The jit-binary repository contains a small Makefile and shell script
that will compile and run on-demand programs distributed in source code form.
Its main use is to allow you to include in your home directory Git repository
small programs that your want to have available in diverse operating systems
and processor architectures.

## Installation
Assuming you keep your personal executable files under `$(HOME)/bin`
simply run `make install`.
If you use another directory for them,
run `make BIN_DIR=/my/bin/directory install`.

## Use
(From here on the name of your personal executable program directory
is referred to as `bin`.)
For each binary program you want to be made available, put its source
code in `bin/jit-binary/src`.
The source code can be one of the following.
* A single C file named after the name of the binary with a `.c` suffix.
* A source code directory named after the binary with a `.make` suffix.
  When one runs `make` in that directory, an executable program with the
  same name as the base directory name should be created.
* Further languages and build systems can be easily accommodated by
  adding a rule in the supplied `Makefile`.
  Pull requests for such rules are gratefully accepted.

In addition, create a symbolic link in your `bin` directory linking the
binary you want to be able to execute to `jit-binary/jit-binary`.

Example:
```
cd $HOME/bin
ln -s jit-binary/jit-binary my-binary-that-will-be-jit-compiled
```

Add the `bin/jit-binary` directory to your Git-distributed home
directory files, and you're ready to go.

Each time you attempt to execute a jit-binary program, this will
be compiled if its binary does not exist, or if its source code
is newer than its binary.
Then, the program will run as if its binary was there all-along.
