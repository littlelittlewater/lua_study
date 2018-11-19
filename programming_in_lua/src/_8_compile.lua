--dofile loadfile 加载file   dofile会直接执行文件
loadfile("_1_helloWorld.lua")();
dofile("_1_helloWorld.lua");


--loadString 总是在全局情况修改i
i = 10;
local i = 0;
f = loadstring("i = i + 1 ;print(i)")
g = function()
    i = i + 1
    print(i)
end
f();
g()

--loadlib
--可以通过loadlib来加载指定的函数库



-- lua执行出错，会退出当前域，然后返回调运程序
--易于避免的错误用assert，不易于避免的用错误码

function alwaysFalse ()
    assert(false, "i am false")
end

function testInvoke ()
    print "i am invoking1";
    --    alwaysFalse();
end
testInvoke()
print "i am invoking2";

--使用pcall来保护代码运行   能过返回错误信息
-- debug.traceback() 可以打印当前的堆栈信息
status, err = pcall(function()
    print(debug.traceback());
    error({ code = "i am error" ,error = error})
end)
if status
then
    print("123");
else
    print("error");
    print(err.code)
end


--xpcall 能够提供更强大的支持
status, err = xpcall(function()
    local msg = "i am xpcall"
    error({ code = "i am error2" })
end,function () print(debug.traceback()) end);