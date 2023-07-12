
the=pi/6;
the2=pi/3;
x=2;
y=0;
T1=[cos(the) -sin(the) 0 x;sin(the) cos(the) 0 y;0 0 1 0;0 0 0 1];
T2=[cos(the2) -sin(the2) 0 x;sin(the2) cos(the2) 0 y;0 0 1 0;0 0 0 1];
TFinal=T1*T2;
F=[1 0 0 0; 0 1 0 0;0 0 1 0;0 0 0 1];
 figure
 line([0,F(1,1)],[0,F(2,1)],[0,F(3,1)],'Linewidth',[1.5],'Color','r')
 line([0,F(1,2)],[0,F(2,2)],[0,F(3,2)],'Linewidth',[1.5],'Color','g')
 line([0,F(1,3)],[0,F(2,3)],[0,F(3,3)],'Linewidth',[1.5],'Color','b')

% orientation of x component wrt to the x value and so on....
%FOR TRANSFORMATION 1
line([T1(1,4),T1(1,4)+T1(1,1)],[T1(2,4),T1(2,4)+T1(2,1)],[T1(3,4),T1(3,1)+T1(3,1)],'Linewidth',[1.5],'Color','r')
line([T1(1,4),T1(1,4)+T1(1,2)],[T1(2,4),T1(2,4)+T1(2,2)],[T1(3,4),T1(3,4)+T1(3,2)],'Linewidth',[1.5],'Color','g')
line([T1(1,4),T1(1,4)+T1(1,3)],[T1(2,4),T1(2,4)+T1(2,3)],[T1(3,4),T1(3,4)+T1(3,3)],'Linewidth',[1.5],'Color','b')

line([TFinal(1,4),TFinal(1,4)+TFinal(1,1)],[TFinal(2,4),TFinal(2,4)+TFinal(2,1)],[TFinal(3,4),TFinal(3,1)+TFinal(3,1)],'Linewidth',[1.5],'Color','r')
line([TFinal(1,4),TFinal(1,4)+TFinal(1,2)],[TFinal(2,4),TFinal(2,4)+TFinal(2,2)],[TFinal(3,4),TFinal(3,4)+TFinal(3,2)],'Linewidth',[1.5],'Color','g')
line([TFinal(1,4),TFinal(1,4)+TFinal(1,3)],[TFinal(2,4),TFinal(2,4)+TFinal(2,3)],[TFinal(3,4),TFinal(3,4)+TFinal(3,3)],'Linewidth',[1.5],'Color','b')

line([2,T1(1,4)],[0,T1(2,4)],'Linewidth',[1.5],'Color','black')

axis([-3 5 -3 5]);
grid on
