# Haskell Basics

## The Glorious Glasgow Haskell Compiler
The Glasgow Haskell Compiler (ghc) is a compiler for Haskell, similar to javac
for Java and g++ for C++.  ghc behaves similarly to gcc ad g++,  if you know how
to compile C/C++ then you probably know how to compile Haskell.

## Running Haskell
Haskell can either be compiled (like C and Java) or interpreted (like Python).  
This gives the us the benefits of efficient programs after compilation and the
speed of development that comes with interpreted languages.

### Interpreted Haskell
Running Haskell interpreted will run the code directly from the source code.  It
will not be optimised very much before it runs but it also doesn't generate
executable files.  When Haskell is run through Sublime Text it is interpreted.

```Bash
$ runhaskell HelloWorld.hs
```

### Compiling Haskell
Compiling Haskel with ghc creates an executable file that can be run again and
again.  When Haskell is compiled it optimises the code before creating an
executable.  Haskell code goes through a huge amount of optimisation, ghc can
compile with different levels of optimisation using the `-O1`,`-O2`,`-O3`,`-O4`
options when compiling.

Compiling files is pretty simple.  To compile `HelloWorld.hs` we usually use.
```Bash
$ ghc -O2 -o compiled/HelloWorld HelloWorld.hs
```
**Note:** I like to make a separate folder for compiled code, usually calling it
compiled.  This is not necessary at all, but it keeps the folder neat.

To run the program, we use:
```
$ ./compiled/HelloWorld
```

### Compiler options

```Bash
-O2 => Compile with optimisation
-o compiled/HelloWorld => Create the executable in the compiled folder with the
name 'HelloWorld'
-threaded => Enable multithreading
```

## Hello, World! in Haskell
```Haskell
main = print "Hello, world!"
```

## Literate Programming

There are two file extensions associated with Haskell source code:
- .hs - Normal Haskell
- .lhs - Literate Haskell

Haskell supports Literate Programming

What is literate programming? To quote Dr. Knuth:

>"The main idea is to regard a program as a communication to human beings rather than as a set of instructions to a computer."

In a literate Haskell program, there are two ways to distinguish between code
and non-code portions. You can: either prepend all code with a > , (bird style)
or surround lines of code with \begin{code} and \end{code} pairs (latex style).
For those who know, use and love latex, the latter is the suggested way to go.

[Literate Haskell - Haskell Wiki](https://www.haskell.org/haskellwiki/Literate_programming)
