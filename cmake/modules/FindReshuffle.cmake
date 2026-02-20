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

FetchContent_MakeAvailable(reshuffle)
