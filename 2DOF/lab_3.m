
the=pi/3;
x=1;
y=2;
T=[cos(the) -sin(the) 0 x;sin(the) cos(the) 0 y;0 0 1 0;0 0 0 1];

F=[1 0 0 0; 0 1 0 0;0 0 1 0;0 0 0 1];
figure
line([0,F(1,1)],[0,F(2,1)],[0,F(3,1)],'Linewidth',[1.5],'Color','r')
line([0,F(1,2)],[0,F(2,2)],[0,F(3,2)],'Linewidth',[1.5],'Color','g')
line([0,F(1,3)],[0,F(2,3)],[0,F(3,3)],'Linewidth',[1.5],'Color','b')

% orientation of x component wrt to the x value and so on....
line([T(1,4),T(1,4)+T(1,1)],[T(2,4),T(2,4)+T(2,1)],[T(3,4),T(3,1)+T(3,1)],'Linewidth',[1.5],'Color','r')
line([T(1,4),T(1,4)+T(1,2)],[T(2,4),T(2,4)+T(2,2)],[T(3,4),T(3,4)+T(3,2)],'Linewidth',[1.5],'Color','g')
line([T(1,4),T(1,4)+T(1,3)],[T(2,4),T(2,4)+T(2,3)],[T(3,4),T(3,4)+T(3,3)],'Linewidth',[1.5],'Color','b')
axis([-3 3 -3 3]);
grid on