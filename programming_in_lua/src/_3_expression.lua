
print(1+2)

print("2"<"15")

print(4 and 1);
print(false and 1);
print(nil and 1);
print(2 or 1);

-- 字符串是不可变的
a = "hello"
print(a.."world");
print(a)

-- table的构造
days={"一","二","三","四","五","六","日"}
print(days[4])
a={x=1,b=2}
print(a.b);
c={};
c.x =2;
print(c.x);

values = {1,2,3,4,5,6,7};
linked={};
print("array iter")
for i in pairs(values) do
    print(i)
    linked={last=linked;value=i;}
end
print("liked iter")
local l = linked;
while l.last do
    print(l.value);
    l = l.last;
end

