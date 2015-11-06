# lua-pb-tools

This is a small set of tools and scripts for building lua-protobuf from [protoc-gen-lua](https://github.com/haiweizhang/protoc-gen-lua).

## Get the tools:
From a folder, say your desktop, open a terminal and enter the following:
```
git clone https://github.com/cjtallman/lua-pb-tools.git
cd lua-pb-tools
build.bat
```
Now, if successful, the command will create a folder named `compiled`. This
folder will contain the necessary files and folders for compiling a proto file
into its lua module representation.

## Compiling a proto file:
Navigate into the compiled folder and use the `compile_proto.bat` script to compile
a proto file to a lua module.  The output will be `<basename>_pb.lua`. So if the
proto file is named `Address.proto`, then the output will be `Address_pb.lua`.
```
cd compiled
compile_proto.bat person.proto
```
The output file is a lua module that can be loaded with `require()`.

Note, for the module to load correctly, the protobuf folder needs to be in the lua package paths.

## Run the example:
```
cd compiled\example
lua51.exe test.lua
```
