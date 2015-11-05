
local gitdir = "protoc-gen-lua"
local luadir = "Lua/5.1.5"
local luaVer = "lua51"

solution("protobuf")
    location("build")
    configurations("Release")
    project("protobuf")
    location("build")
    kind("SharedLib")
    language("c")
    targetname("pb")
    targetdir("compiled/protobuf")
    defines
    {
        "WIN32";
    }
    flags
    {
        "MultiProcessorCompile";
        "NoImportLib";
        "NoIncrementalLink";
    }
    disablewarnings
    {
        "4244"  -- disable int64_t and uint64_t to lua_Integer warnings
    }
    includedirs
    {
        luadir .. "/include";
    }
    libdirs
    {
        luadir
    }
    links
    {
        luaVer .. ".lib"
    }
    files
    {
        gitdir .. "/protobuf/*.c";
    }
    local copyCmd = '(robocopy "%s" "%s" %s) ^& IF %%ERRORLEVEL%% LEQ 1 SET ERRORLEVEL=0 '; -- Eat Robocopy return codes.
    postbuildcommands
    {
        "{DELETE} %{cfg.targetdir}/pb.lib"; -- I can't figure out how to not make these, so let's just delete them.
        "{DELETE} %{cfg.targetdir}/pb.exp"; -- ""
        copyCmd:format("../" .. luadir, "../compiled/example", luaVer..".exe " .. luaVer..".dll");
        copyCmd:format("../example", "../compiled/example", "");
        copyCmd:format("../" .. gitdir .. "/protobuf", "../compiled/protobuf", "*.lua");
        copyCmd:format("../" .. gitdir .. "/plugin", "../compiled/plugin", "protoc-gen-lua plugin_*");
        copyCmd:format("../" .. gitdir .. "/", "../compiled", "protoc.exe");
        copyCmd:format("../" .. gitdir .. "/example", "../compiled", "*.proto");
        "ECHO @python plugin/protoc-gen-lua> ../compiled/plugin/lua_out.bat";
        "ECHO @ECHO OFF>> ../compiled/compile_proto.bat";
        "ECHO protoc --lua_out=./ --plugin=protoc-gen-lua=plugin\\lua_out.bat %%*>> ../compiled/compile_proto.bat";
    }
