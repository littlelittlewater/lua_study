--如果函数只有一个参数，且是一个字符串和table
print { fdaf = 123 };

--面对对象编程
o = {};
function o.foo(o, key)
    print(key)
end
o:foo(33)
o.foo(o, 33);

--递加数
count = 0
function add(n)
    n = n or 1;
    count = count + n;
end
for i = 1, 100 do
    add();
end
print(count)

--多重返回值
function multiple()
    return 1, 2, 3, 4, 5
end

print(multiple())
x, y = multiple(), 20
print(x, y)

--unpack 会返回table中所有的值
--注意其他语言为什么会很难做到？因为其他语言必须知道参数个数，才能传
print(unpack { 10, 20, 30 })

--可变参数
function multipleIn(a, b, c, d, e)
    print(a, b, c, d, e)
end
multipleIn(1, 2, 3)


--具名实参
function
printer(x, y)
    print(x, y)
end

function rename(arg)
    return printer(arg.old, arg.new)
end
rename { new = "new", old = "old" }