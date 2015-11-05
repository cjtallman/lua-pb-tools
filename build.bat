SETLOCAL
@ECHO OFF
RMDIR /Q /S protoc-gen-lua
git clone https://github.com/haiweizhang/protoc-gen-lua.git

CALL "%VS100COMNTOOLS%\vsvars32.bat"
rmdir /Q /S compiled
CALL premake5.exe vs2010
msbuild "build\protobuf.sln" /m
rmdir /Q /S build

ENDLOCAL
