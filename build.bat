SETLOCAL
@ECHO OFF

:: Clean up any previous builds
RMDIR /Q /S compiled

:: Get a clean checkout of lua-protobuf from github
RMDIR /Q /S protoc-gen-lua
git clone https://github.com/haiweizhang/protoc-gen-lua.git

:: Load VS environment
CALL "%VS100COMNTOOLS%\vsvars32.bat"

:: Make build projects
CALL premake5.exe vs2010

:: Build the projects
msbuild "build\protobuf.sln" /m

:: Cleanup
RMDIR /Q /S build
RMDIR /Q /S protoc-gen-lua

ENDLOCAL
