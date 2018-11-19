--迭代器就是闭包的实现
function values ()
    local i = 0;
    return function()
        i = i + 1;
        return t[i]
    end
end
t = { 1, 2, 3 }
iter = values();
while true do
    local element = iter();
    if element == nil then
        break
    end
    print(element)
end

for element in values(t) do
    print(element)
end

--for的语义
--for中保存这三个值 一个迭代器函数 一个控制函数  一个恒定状态
--如果第一个值为nil 则迭代器返回
--for可以迭代多个值

--尽量使用无状态的迭代器
--如上面
