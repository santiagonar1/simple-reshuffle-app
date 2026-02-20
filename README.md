# Simple reshuffle app

This is an example of how to use the [reshuffle](https://github.com/santiagonar1/reshuffle) library with an external
application. It demonstrates how a matrix can be distributed across multiple processors, and how this distribution can
easily be changed using our library

To build it, do:

```shell
mkdir build && cd build
cmake -DCMAKE_PROJECT_TOP_LEVEL_INCLUDES=conan_provider.cmake ..
make -j
```

In MacOS, we suggest using Homebrew to install clang, and using
our [MacBrewLLVMToolchain.cmake](./cmake/MacBrewLLVMToolchain.cmake) when configuring the project:

```shell
cmake -DCMAKE_PROJECT_TOP_LEVEL_INCLUDES=conan_provider.cmake -DCMAKE_TOOLCHAIN_FILE=cmake/MacBrewLLVMToolchain.cmake ..
```

Then, run it with four ranks:

```shell
mpirun -np 4 ./simple.out
```


