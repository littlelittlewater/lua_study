x,y = 2,3
x,y=y,x
print(x,y)

-- if else
i = 10
if true then
    local i = i ;
    i = i+1;
    print(i)
end
print(i)


if true then
    print("if")
    if false then
    else
        print("else")
    end
end


local i = 3;
while i ~=0 do
    print(i)
    i=i-1;
end

-- repeat
repeat
    print(i)
    i=i+1;
until i==3;


-- for
for iter =1,2,3 do
    print(i)
end


-- iter
for i in pairs({"pairs",1,2,3}) do
    print(i)
end



-- while
local i = 0;
while i < 100 do
    i = i+1;
    if(i == 10 ) then
        break;
    end
    print(i)
end