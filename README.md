# Simple reshuffle app

This is an example of how to use the [reshuffle](https://github.com/santiagonar1/reshuffle) library with an external
application. The application is just a small demo that demonstrates how a matrix can be distributed across multiple
processors, and how this distribution can easily be changed using our library

To build this project, you need to install [Conan](https://conan.io/) and run the following commands:

```shell
mkdir build && cd build
cmake -DCMAKE_PROJECT_TOP_LEVEL_INCLUDES=conan_provider.cmake ..
make -j
```

In macOS, we suggest using Homebrew to install clang and using
our [MacBrewLLVMToolchain.cmake](./cmake/MacBrewLLVMToolchain.cmake) when configuring the project:

```shell
cmake -DCMAKE_PROJECT_TOP_LEVEL_INCLUDES=conan_provider.cmake -DCMAKE_TOOLCHAIN_FILE=cmake/MacBrewLLVMToolchain.cmake ..
```

Then, run it with four ranks:

```shell
mpirun -np 4 ./simple.out
```

## How to make your own app work with reshuffle

We will assume that your project is a CMake project, since that makes it easier to integrate with reshuffle. If that
is the case, you need to:

1. Copy our [Findreshuffle.cmake](cmake/modules/Findreshuffle.cmake) module into your project's CMake modules folder.
2. Call `find_package(reshuffle)` in your project's CMakeLists.txt.
3. Link your project against the `reshuffle::reshuffle` target.

If you have not used CMake modules before, remember to indicate the path to whethever you save `Findreshuffle.cmake` in
your CMakeLists.txt file with `CMAKE_MODULE_PATH`.

If you are in doubt, take a look at our [CMakeLists.txt](CMakeLists.txt) where all of this is done.

Finally, reshuffle requires the [zpp_bits](https://github.com/eyalz800/zpp_bits) library to be installed in your system.
If you are using conan (and you should ;-) ), then add it to your conanfile.txt, as in
our [example](conanfile.txt).
