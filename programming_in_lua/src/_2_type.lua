--- nil代表无效值
print(type(nil))

--除了fasle == fasle 其他都等于true
print("------ bool ------")
print(type(true))
print(nil == false , 0 == false)
-- lua是统一使用双精度浮点数处理所有的数字
print(type(1))

-- 使用[[]]括起来可以写文本
-- 通过#操作符获取字符长度
-- 类型最好不要使用显示的转换
print(type("fdasf"))

local temp = [[""fdafa这里的任何符号都不
    会转义\n]]
print(temp)

print(#temp)

-- print(temp + 10) 这儿会报错 因为temp不是数字
print("10" + 1)

--table可以高效的表达数组，符号表，集合，队列，及其他数据结构
--table当他没有被引用的时候会被销毁，table是匿名的
--a.i 是 a["i"] 的语法糖   点后面是一个定值，[]可以是一个变量

print("------ table ------")
a={}
for i = 1, 100 do
    a[i] = i*2
    a["i" .. tostring(i)] = i* 2
end
print(a[23]);

X="i25"
print(a["i25"])
print(a[X])
print(a.i25)
print(a.X); --他只会去找a["X"] ，就算X是个变量他也会当作一个字符串处理

array ={}
array[10000] =1
print(#array)

--第六章讲
print(print)

-- userdata thread 后面讲

