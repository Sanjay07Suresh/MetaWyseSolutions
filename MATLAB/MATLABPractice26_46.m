%%
t = 0:0.01:1;
f = 2;
a = 5;
x = a*sin(2*pi*f*t);
plot(t,x);

%%
t = 0:0.01:1;
f = 2;
a = 5;
x = a*sin(2*pi*f*t);
plot(t,x,'r<-','MarkerSize',2,'LineWidth',2);
grid on
xlabel('time','FontSize',10)
ylabel('amplitude','FontSize',10)
title('sinewave graph','FontSize',16)
legend('sinewave')
text(0.05,0.5,'theta is 90');

%%

t = 0:0.1:2*pi;
x = sin(t);
y = cos(t);
plot(t,x,'r<-','MarkerSize',2,'LineWidth',2);
hold on
plot(t,y,'b<-','MarkerSize',2,'LineWidth',2);
hold off
grid on
xlabel('time','FontSize',10)
ylabel('amplitude','FontSize',10)
title('sine & cos wave graph','FontSize',16)
legend('sinewave','coswave','Location','Best');

%%

t = 0:0.1:2*pi;
x = sin(t);
y = cos(t);
subplot(1,2,1);
plot(t,x,'r<-','MarkerSize',2,'LineWidth',2);
grid on
xlabel('time','FontSize',10)
ylabel('amplitude','FontSize',10)
title('sinewave graph','FontSize',16)
legend('sinewave','Location','Best');

subplot(1,2,2);
plot(t,y,'b<-','MarkerSize',2,'LineWidth',2);
grid on
xlabel('time','FontSize',10)
ylabel('amplitude','FontSize',10)
title('coswave graph','FontSize',16)
legend('coswave','Location','Best');

%%

r=input('Radius = ');
disp(r);
z=input('Enter a String: ','s');
disp(z);

%%

a=[12,14,17,21,15];
bar(a,0.6,'blue','EdgeColor','k','LineWidth',2);
xlabel('Bar Graph','FontSize',16)
ylabel('Number','FontSize',10)
title('Amplitude','FontSize',10)
axis([0,length(a)+1,10,22]);

%%

y =[22 18;29 24;32 45;26 15];
bar(y);
xlabel('Bar Graph','FontSize',16)
ylabel('Number','FontSize',10)
title('Amplitude','FontSize',10)
axis([0,length(y)+1,10,50]);

%%
x = 2018:1:2021;  % x positions (years)
y = [22 15 20 18; 29 22 28 24; 32 29 26 45; 26 21 18 15];  % data matrix
z = bar(x, y);
bar(x, y);
figure
bar(x,y(:,2));
figure
bar(x,y(2,:));

%%

x=0:0.01:2*pi;
y1=sin(x);
y2=cos(x);

yyaxis left
plot(x,y1,'LineWidth',2);
xlabel('time');
ylabel('amplitude y1');

yyaxis right
plot(x,y1,'LineWidth',2);
ylabel('amplitude y2');
title('Sin and Cos FN');

%%
magnitude = [1,2,3,4,5,6,7,8,9];
energy = [6.3e5,2e7,6.3e8,2e10,6.3e11,2e13,6.3e14,2e16,6.3e17];
semilogy(magnitude,energy,'o-','LineWidth',2);
grid on;
title('Logarithm Scale');
xlabel('Magnitude');
ylabel('Energy(Joules)');

figure
semilogx(magnitude,energy,'o-','LineWidth',2);
grid on;
title('Logarithm Scale');
xlabel('Magnitude');
ylabel('Energy(Joules)');


figure
loglog(magnitude,energy,'o-','LineWidth',2);
grid on;
title('Logarithm Scale');
xlabel('Magnitude');
ylabel('Energy(Joules)');
%%

num = [1 2 3];
den = [1 2 1];
sys = tf(num,den);
bode(sys);
grid on
title('Bode Plot');
margin(sys);
%%

num=[1];
num1=[1 2];
den=[1 2 1];
den1=[1 2 3];
sys=tf(num,den);
sys1=tf(num1,den1);
nyquist(sys,sys1);
nyquist(sys,'r',sys1,'b--');
grid on;

%%
num = [1];
den = [1 2 1];
sys = tf(num,den);
nichols(sys);

%%

t=0:0.001:1;
vm=input('Max Magnitude = ');
f=input('Frequency(hz) = ');
vr=vm*sin(2*pi*f*t);
vy=vm*sin((2*pi*f*t)-(2*pi/3));
vb=vm*sin((2*pi*f*t)+(2*pi/3));
hold on;
plot(t,vr,'r','LineWidth',2);
hold on;
plot(t,vy,'y','LineWidth',2);
hold on;
plot(t,vb,'b','LineWidth',2);
legend('R','Y','B');
xlabel('Time');
ylabel('Voltage')
title('3-ph Voltage','FontSize',14);

%%


x=-pi:0.1:pi;
y=sin(x);
z=x.*sin(x);
plot3(x,y,z,'LineWidth',3);
xlabel('x');
ylabel('y');
zlabel('z');
title('Simple 3D plot');
view([-8,32]);

figure
scatter3(x,y,z,'LineWidth',3);
xlabel('x');
ylabel('y');
zlabel('z');
title('Simple 3D plot');
view([-8,32]);

figure
plot3(x,y,z,'ob','LineWidth',3);
xlabel('x');
ylabel('y');
zlabel('z');
title('Simple 3D plot');
view([-8,32]);

%%

axis square
grid on
hold on
h2 = plot3(x(1),y(1),z(1));
view([12,20])
for k= 2:length(x)
    set(h2,'xdata',x(1:k),'ydata',y(1:k),'zdata',z(1:k));
    pause(0.1)
end
hold off;

%%

x= -pi:0.1:pi;
y= sin(x);
[X,Y]=meshgrid(x,y);
z= X.*sin(y);
surf(x,y,z);
grid on;

%%

x=1:0.1:10;
y=2:0.2:5;
[X,Y]=meshgrid(x,y);
z=sin(X).*cos(Y);
mesh(x,y,z);
xlabel('x');
ylabel('y');
zlabel('z');
title('Simple 3D Plot');

figure
z=sin(X).*cos(Y);
surf(x,y,z);
shading interp
colorbar;
colormap(summer(8));
xlabel('x');
ylabel('y');
zlabel('z');
title('Simple 3D Plot');

%try with these
%waterfall(x,y,z);
%contour(x,y,z,13);
%contour(x,y,z);

%%

% Independent variables
t = -pi:0.01:pi;
x = sin(t);
y = cos(t);

% Create a grid
[X, Y] = meshgrid(t, t);

% Base surface data
Z = cos(X) .* sin(Y);

% Initialize the plot
figure;
h = surf(X, Y, Z);      % Create the surface
shading interp;         % Smooth the shading
axis([-1 1 -1 1 -1 1]); % Set axis limits
xlabel('x'); ylabel('y'); zlabel('z');

% Animation loop
for k = 0.1:0.1:20
    % Update Z values with animation effect
    Z1 = sin(k * Z);
    set(h, 'ZData', Z1);  % Update the surface data
    title(sprintf('k = %.1f', k)); % Update the title
    pause(0.01);          % Pause for animation effect
end

%%

x = 1:0.1:20;
y = 1:0.1:20; % Ensure the same length for x and y
[X, Y] = meshgrid(x, y); % Generate 2D grids for x and y
Z = sin(X); % Z must be a 2D matrix based on X or Y
surf(X, Y, Z); % Create the surface plot
shading interp; % Optional: Smooth shading
xlabel('x'); ylabel('y'); zlabel('z'); % Add labels


%%

surf(peaks);
membrane
colorbar
colormap(hot(7));

figure
m=[0.1,0.2,0.3];
surf(peaks);
colorbar
colormap(m);

%%

t = 0:0.1:2*pi;
a=sin(t);
plot(t,a,'r<-','MarkerSize',2,'LineWidth',2);
grid on;
xlabel('Time','FontSize',10);
ylabel('Time','FontSize',10);
zlabel('Time','FontSize',16);
legend('sinewave');
text(1,0.5,'Theta is 90');
