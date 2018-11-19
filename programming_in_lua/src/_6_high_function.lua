-- 函数和其他的东西都是匿名的，和表一样
a = { b = print };
a.b("fda");

-- 下面这两种声明方式是等价的
function hello()
    print("hello")
end
hello2 = function()
    print("hello")
end
hello();
hello2()

--闭包
--按道理来讲，lua只有闭包，没有函数
--没有局部变量的闭包就是函数
function Counter()
    local i = 0;
    return function()
        i = i + 1;
        return i;
    end
end
counter = Counter();
print(counter());
print(counter());

--这种技术可以很方便替换以前的函数
print2 = print;
print = function(str) print("print：" .. str ) end
print("234");
--非全局函数
Class = {}
Class.fun1 = function(x, y)
    return x + y
end
Class.fun2 = function(x, y)
    return x + y
end

--正确的尾调用 ，只有返回不需要计算的值才叫尾调用
--错误的调用,因为有加法
function errorRun() return errorRun()+1 end
--一个简单的状态机
local m = { 1, 2, 1, 2, 2, 1, 2, 1, 2, 1 }
print("---start")
function add1(index)
    print(2)
    if (m[index + 1] == 1) then
        return add1(index+1)
    else
        if (m[index + 1] == 2) then
            return add2(index+1)
        else
            return nil;
        end
    end
end

function add2(index)
    print(1)
    if (m[index + 1] == 1) then
        return add1(index+1)
    else
        if (m[index + 1] == 2) then
            return add2(index+1)
        else
            return nil;
        end
    end
end

add1(1);