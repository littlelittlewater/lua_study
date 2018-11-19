-- 比较有趣的一章
-- 一个具有多个线程运行条件的可以同时运行几个线程  然而协同程序任意时刻只能运行一个
co = coroutine.create(function()
    print("hi")
end)
print(co)
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))

-- 协同程序最重要的是可以让运行中的函数挂起，然后在运行
-- 感觉是一种更强大的抽象方式
co = coroutine.create(function()
    for i = 1, 10 do
        print("co" .. i);
        coroutine.yield();
    end
end)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)

print("resume yeild")


-- resume yeild 可以交换数据
myFun = coroutine.create(function(i, j)
    for i = 1, 10 do
        coroutine.yield(i + j, i - j);
    end
end)
print(coroutine.resume(myFun, 1, 2));
print(coroutine.resume(myFun, 2, 3))

-- 三个线程相互通知
-- 注意这个和下面那种模型的区别
fun1 = coroutine.create(function()
    for i = 0, 10 do
        print("thread 1" .. i);
        coroutine.resume(fun2)
        coroutine.resume(fun3)
        coroutine.resume(fun4)
    end
end)

fun2 = coroutine.create(function()
    for i = 0, 10 do
        print("thread 2" .. i);
        coroutine.yield();
    end
end)

fun3 = coroutine.create(function()
    for i = 0, 10 do
        print("thread 3" .. i);
        coroutine.yield();

    end
end)
coroutine.resume(fun1);


-- 消费驱动的模型
-- 感觉有点像函数的层次调用
costomer = coroutine.create(function(x)
    local i = 0;
    while i ~= 5 do
        i = i + 1;
        local status, x = coroutine.resume(producer)
        print(x)
    end
end)

filter = coroutine.create(function(X)
    local i = 0;
    while i ~= 5 do
        i = i + 1;
        coroutine.yield("filter" .. i)
    end
end)

producer = coroutine.create(function()
    local i = 0;
    while i ~= 5 do
        i = i + 1;
        status,key = coroutine.resume(filter,i)
        coroutine.yield(key)
    end
end)

coroutine.resume(costomer)