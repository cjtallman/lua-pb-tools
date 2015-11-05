# lua-pb-tools

This is a small set of tools and scripts for building lua-protobuf from [protoc-gen-lua](https://github.com/haiweizhang/protoc-gen-lua).

# Get the tools:
```
git clone https://github.com/cjtallman/lua-pb-tools.git
cd lua-pb-tools
build.bat
```

## Compiling a proto file:
```
cd compiled
compile_proto.bat person.proto
```

## Run the example:
```
cd compiled\example
lua51.exe test.lua
```
