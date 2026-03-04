# Pawn

## What is this?

This is a modified copy of the Pawn compiler version 3.2.3664 by Compuphase that fixes some bugs and adds a few features.

## Why does this repository need to be created?

[gskeleton/pawn](https://github.com/gskeleton/pawn) is a repository of the Pawn Compiler from [pawn-lang/compiler](https://github.com/pawn-lang/compiler), based on [Pawn Compiler v3.10.7](https://github.com/pawn-lang/compiler/releases/tag/v3.10.7), which has been specifically modified and intentionally adjusted to support more flexible and faster updates. In addition, fixes from other versions are backported into v3.10.7 in gskeleton/pawn without requiring the use of a higher compiler version. This compiler also resolves unexpected issues by changing the concept of pc_compat and removing pc_compat entirely - [commit](https://github.com/gskeleton/pawn/commit/559e6a1c36b238d5d2d973c029fb39185a7f0bfa).

## Installation on Windows or GNU/Linux

1. Extract the .zip or .tar.gz archive from [Releases](https://github.com/gskeleton/pawn/releases)
2. and install the files from the bin folder into pawno or qawno.
3. Additionally, install libpawnc.so for Linux systems into the /usr/local/lib directory as shown below:
- Linux:
```yml
sudo mv libpawnc.so /usr/local/lib
sudo echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib" >> ~/.bashrc && source ~/.bashrc
```
- Termux:
```yml
mv libpawnc.so /data/data/com.termux/files/usr/local/lib
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/data/com.termux/files/usr/local/lib" >> ~/.bashrc && source ~/.bashrc
```
4. Once completed, you can run pawncc.exe or `./pawncc.`

## Building from source code

In general you will need [CMake](https://cmake.org/) and a C compiller to build Pawn from source code.

### Building on Windows

* Download: https://github.com/gskeleton/pawn/archive/refs/heads/main.zip
* Extract the Archive.
* Open the "pawn" folder in Visual Studio.

  From the "Tools" menu in Visual Studio, open Command Prompt or PowerShell and execute the following:

  ```yml
  cd pawn/source/compiler
  mkdir build; cd build
  cmake .. -A Win32; cmake --build . --config Release
  ```

  This will create `pawnc.dll` and `pawncc.exe` in the `Release` folder.
  
### Building on Linux

Use your distribution's package manager to install the required dependencies. For example, in Ubuntu you would do:

```yml
sudo apt install gcc gcc-multilib make cmake
```

`gcc-multilib` is needed for compiling a 32-bit binary (64-bit is not supported).

Now you can clone this repo and build the compiler:

```yml
git clone https://github.com/gskeleton/pawn &&
cd pawn/source/compiler &&
mkdir build && cd build &&
cmake .. -DCMAKE_C_STANDARD=99 -DCMAKE_C_FLAGS=-m32 -DCMAKE_BUILD_TYPE=Release
```

Replace "Release" with "Debug" if you want to build a debug executable for development or submitting bugs.

## Background

The project was originally started as a set of patches aimed to create a compiler that would be compatible with the compiler used in [SA-MP (San Andreas Multiplayer)](http://sa-mp.com/).

SA-MP uses a modified version of Pawn 3.2.3664 [1] with Windows-only executables, and the developers said that they lost the source code for it which means it can't be ported to other platforms (e.g. Linux) and newly discovered bugs can't be fixed. So the main goal of the project is to re-create changes that were previously made by the devs as well as fix all known compiler bugs.

[1] It's worth noting that the version of the AMX embedded into the SA-MP server seems to be based on an older release of Pawn.