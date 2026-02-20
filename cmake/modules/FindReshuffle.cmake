include(FetchContent)

if (RESHUFFLE_FOUND)
    message(STATUS "Reshuffle library found")
    return()
endif ()

message(STATUS "Reshuffle library NOT found, will download and build")

FetchContent_Declare(
        reshuffle
        GIT_REPOSITORY https://github.com/santiagonar1/reshuffle.git
        GIT_TAG main
)

set(RESHUFFLE_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(RESHUFFLE_BUILD_DEMOS OFF CACHE BOOL "" FORCE)
set(RESHUFFLE_BUILD_BENCHMARKS OFF CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(reshuffle)
