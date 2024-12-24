%% 

f=[1 3 5]
m=[1 3 5 ; 7 9 11]

%%
a = [1 3 4; 5 6 3];
b = [1 2 3; 4 5 6];

c = dot(a,b)
d = cross(a,b)

%%
f = 50;
l = 0.02;
xl = 2*pi*f*l

%%

x =[1 2 3 4;
    1 2 3 4;
    1 2 3 4];

sum(x, 'all')
sum(x)
sum(x, 2)
sum(x(:, 2))
sum(x(2, :))
sum(x([1, 2], :))
sum(sum(x([1, 3], [1, 2])))

%%
r=5;
disp(['Radius = ',num2str(r)]);
disp([' ']);
fprintf('Value: %d',r);
disp([' ']);
for i = 1:5
    fprintf('iteration %d : i squared is %d\n',i,i^2);
end
disp([' ']);
fprintf('%-10s %10s\n','Name','Score');
fprintf('%-10s %10.2f\n','Alice',95.5);

%%
function f = sineplot(a,b)
t = 0:0.001:1;
f = a*sin(2*pi*b*t);
plot(t,f);
end

sineplot(10,1);

f1 = @(a) a^2+5
f1(3)

f2 = inline('a^2+5','a')
f2(3)

%%

syms x y
eq1 = 2*x+8*y == 15;
eq2 = 9*x-6*y == 21;
sol = solve([eq1,eq2],[x,y]);
disp(sol.x);
disp(sol.y);

%%
t = 0:0.1:10
f = @(t,x)(2-x^2);
[t,x] = ode23(f,t,1)
plot(t,x);

%%
x=4;
k=2;
u=1;
y0=0.5;

f = @(y,u) ((-y+k*u)/x)
[t,y] = ode45(f,[0 1],y0) % [0 1] is the time range to solve ODE
plot(t,y);

%%
syms x y
a = 2*x+y == 10;
solve(a,y)

[su, sv] = solve([12*x - 3*y == 10, 2*x + 7*y == 5], [x, y]) %x is su and y is sv
%%
a = 2*x+y;
subs(a,y,x)
subs(a,{x,y},{10,20})
%%

f = [4 7];
f1 = [3 -4 7];
roots(f)
roots(f1)

%%
a=zeros(4,4)
b=ones(3,3)
c=eye(3)
d=diag([1,2,3])
e=rand(4,4)
f=randi([4,12],3,3)
g=magic(3)
%%
a=[1,2,3]
b=transpose(a)
c=a'

x=[1 2-3i 3+1i]
y=x'
z=x.'
%%
a = [1,2
     4,5];

r=a+a
p=a-a
s=a*a

l = [1 2 3 4];
m = [1 2 3 4];
o = l.*m
j = l./m
%%
a=[1 2 3; 4 5 6;7 8 9]
b=a(2,2)
c=a(3,:)
d=a(:,2)
e=a(2:3,1:2)
%%
m = 1:5;
n = 1:3;

for i = 1: length(m)
    for j = 1: length(n)
        a(i,j)=m(i)+n(j)
    end
end
%%
x=0;
while x<10
    disp(x)
    x=x+1;
end
%%

m =input('Enter value: ');
i=m;
x=1;
while i>1
    x=x*i;
    i=i-1;
end
disp(x);
%%
x=10;
y=20;
if x>y
    disp('x is greater than y');
elseif x==y
    disp('x is equal to y');
else
    disp('x is less than y');
   
end
%%

