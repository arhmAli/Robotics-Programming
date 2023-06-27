% Draw a line and frame in 2D & 3D
figure

line([0,0],[0,1],[0,0],'Linewidth',[1],'Color','r');
line([0,1],[0,0],[0,0],'Linewidth',[1.5],'Color','g');
line([0,0],[0,0],[0,1],'Linewidth',[2],'Color','b');
%specifying an offset for drawing frame of reference
axis([-3 3 -3 3]);


%Make a rotation matrix

%specified the angle 
theta=pi/4;

%Typical Rotation matrix for x-axis as fixed

Rx=[1 0 0;0 cos(theta) -sin(theta);0 sin(theta) cos(theta)];

%Typical Rotation matrix for y-axis as fixed

Ry=[cos(theta) 0 sin(theta);0 1 0 ; -sin(theta) 0 cos(theta)];

%Typical Rotation matrix for z-axis as fixed

Rz=[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0;0 0 1];

%Declaration of matrices for different uses
R=Rx;
R1=Ry;
R2=Rz;

%---------Plotting---------

%X-axis fixed
figure
line([0,R(1,1)],[0,R(2,1)],[0,R(3,1)],'Linewidth',[1.5],'Color','r')
line([0,R(1,2)],[0,R(2,2)],[0,R(3,2)],'Linewidth',[1.5],'Color','g')
line([0,R(1,3)],[0,R(2,3)],[0,R(3,3)],'Linewidth',[1.5],'Color','b')
axis([-3 3 -3 3]);

%Y-axis fixed

%Figure-2 for another graph.
figure

line([0,R1(1,1)],[0,R1(2,1)],[0,R1(3,1)],'Linewidth',[1.5],'Color','r')
line([0,R1(1,2)],[0,R1(2,2)],[0,R1(3,2)],'Linewidth',[1.5],'Color','g')
line([0,R1(1,3)],[0,R1(2,3)],[0,R1(3,3)],'Linewidth',[1.5],'Color','b')
axis([-3 3 -3 3]);

%Z-axis fixed

%Figure-3 for another graph(z-axis).

figure

line([0,R2(1,1)],[0,R2(2,1)],[0,R2(3,1)],'Linewidth',[1.5],'Color','r')
line([0,R2(1,2)],[0,R2(2,2)],[0,R2(3,2)],'Linewidth',[1.5],'Color','g')
line([0,R2(1,3)],[0,R2(2,3)],[0,R2(3,3)],'Linewidth',[1.5],'Color','b')
axis([-3 3 -3 3]);


%-----------Finding determinant of matrices---------. 

xDet=det(R1);

yDet=det(R);

zDet=det(R2);

fprintf("As %d = %d we see the property of rotation matrix satisfied! \n",zDet,yDet);

%---------------Testing For the Dot product of the matrices-------


dot(R(:,1),R(:,2));

dot(R(:,2),R(:,3));

dot(R(:,3),R(:,1));




%---------------Testing For the Cross product of the matrices-------


cross(R(:,1),R(:,2));

cross(R(:,2),R(:,3));

cross(R(:,3),R(:,1));

%---------------Testing For the Commutative Property of the matrices-------

com=R*R1;

com2=R1*R2;

com3=R2*R;

%---------Testing the commutative to be true!----

if com(:,1).*com(:,2)==com(:,2).*com(:,3)
    fprintf("The comutative property for %d is proved \n",com)
else
             fprintf("For the given matrix:\n");
             fprintf(" %g %g %g \n",com);
            fprintf("Not commutative so its a rotation matrix !!!\n")
end


if (com(:,1).*com(:,2)).*com(:,3)==com(:,1).*(com(:,2).*com(:,3))
    fprintf("For the given matrix:\n");
    fprintf(" %g %g %g \n",com);
    fprintf("The Associative property  is proved" );
        else
            fprintf("Not Associative")
end
%Represent The actual position of a Robotic finger on a given point! using
%refrences of fixed and mobile axeses!

p=[1;1;1];
p1=com*p;
p2=com2*p;
p3=com3*p;
figure
line([0,p1(1,1)],[0,p2(1,1)],[0,p3(1,1)],'Linewidth',[1],'Color','r');
line([p1(1,1),p1(2,1)],[p2(1,1),p2(2,1)],[p3(1,1),p3(2,1)],'Linewidth',[1.5],'Color','g');
line([p1(2,1),p1(3,1)],[p2(2,1),p2(3,1)],[p3(2,1),p3(3,1)],'Linewidth',[2],'Color','b');
axis([-3 3 -3 3]);
