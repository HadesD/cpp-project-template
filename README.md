# cpp-single-template


## How to use this template

1. Clone this repo:
    ```
    git clone <link to this repo> <project name>
    ```
    If you have it already, you can clone from local directory:
    ```
    git clone --local <path to this repo> <project name>
    ```

2. Rename this repo

    Replace `cpp-single-template` with your project name in `CMakeList.txt`, `vcpkg.json`, and `README.md`

    Rename `.vscode/cpp-single-template.code-workspace` to `.vscode/<project name>.code-workspace`

    Remove "How to use this template" section completely by remove line 3 to 30 (inclusive)

3. Start as a new repo

    Delete `.git` directory, then run

    ```
    git init
    git submodule add https://github.com/microsoft/vcpkg vcpkg
    git add .
    git commit -m "Init"
    ```


## How to configure with CMake

Use CMake presets, list all avaliable presets:
```
cmake --list-presets
```
Then choose one, for example on Windows:
```
cmake --preset vs2022-default
```
On Windows, if you're not using `vs2022-...` presets, you'll need to make sure to have `g++`, `clang++`, `clang-cl`, or `cl` avaliable on your console before calling CMake configure.


## How to use external libraries

### Using built-in libraries
Make sure to install needed libraries before running CMake configure.

### Using vcpkg
- Add the library's names to `vcpkg.json` `"dependencies": [ ... ]"`
- Run `cmake --preset ...` again. `vcpkg` will build and installed those libraries for you. In addition to that, `vcpkg` will tell you how to find and link those libraries with CMake.
- Add `find_package(...)` and `target_link_libraries(...)` to `CMakeList.txt`


## How to debug with VS Code

You only need Microsoft C/C++ extension (cpptools).

- Intenllisense profiles are stored in `.vscode/c_cpp_properties.json`
- Build commands are store in `.vscode/tasks.json`
- Debug profiles are stored in `.vscode/launch.json`
- Open `.vscode/cpp-single-template.code-workspace` with VS Code

### Linux

- For `ninjam-linux`: it works out of the box, nothing to do.

### Windows

- For MinGW presets: you need to set `MINGW_ROOT` environment var to `/mingw64` folder (or `/mingw32`). For example `D:\msys64\mingw64`

- For MSVC presets: you need to open VS Code with `vcvars64.bat` (or `vcvars32.bat`) enabled. For example from powershell terminal run:

  ```
  cmd
  "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
  code .vscode/cpp-single-template.code-workspace
  ```