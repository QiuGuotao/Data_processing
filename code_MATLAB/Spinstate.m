
A(1,:) = Inplane1000(2,:);
B(1,:) = Inplane1000(1,:);
C(1,:) = cross(A(1,:),B(1,:));

A(2,:) = Inplane1000(2,:);
B(2,:) = Inplane1000(11,:);
C(2,:) = cross(A(2,:),B(2,:));

A(3,:) = Inplane1000(4,:);
B(3,:) = Inplane1000(3,:);
C(3,:) = cross(A(3,:),B(3,:));

A(4,:) = Inplane1000(4,:);
B(4,:) = Inplane1000(1,:);
C(4,:) = cross(A(4,:),B(4,:));

A(5,:) = Inplane1000(6,:);
B(5,:) = Inplane1000(5,:);
C(5,:) = cross(A(5,:),B(5,:));

A(6,:) = Inplane1000(6,:);
B(6,:) = Inplane1000(3,:);
C(6,:) = cross(A(6,:),B(6,:));

A(7,:) = Inplane1000(8,:);
B(7,:) = Inplane1000(7,:);
C(7,:) = cross(A(7,:),B(7,:));

A(8,:) = Inplane1000(8,:);
B(8,:) = Inplane1000(5,:);
C(8,:) = cross(A(8,:),B(8,:));

A(9,:) = Inplane1000(10,:);
B(9,:) = Inplane1000(9,:);
C(9,:) = cross(A(9,:),B(9,:));

A(10,:) = Inplane1000(10,:);
B(10,:) = Inplane1000(7,:);
C(10,:) = cross(A(10,:),B(10,:));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x1 = Position450(1,1);
    y1 = Position450(1,2);
    z1 = Position450(1,3);
    x2 = Position450(5,1);
    y2 = Position450(5,2);
    z2 = Position450(5,3);   
    x3 = Position450(9,1);
    y3 = Position450(9,2);
    z3 = Position450(9,3);
    [C159(1,1), C159(1,2), C159(1,3), C159(1,4)] = centerCircle3d(x1,y1,z1,x2,y2,z2,x3,y3,z3);
    
    x1 = Position1000(1,1);
    y1 = Position1000(1,2);
    z1 = Position1000(1,3);
    x2 = Position1000(5,1);
    y2 = Position1000(5,2);
    z2 = Position1000(5,3);   
    x3 = Position1000(9,1);
    y3 = Position1000(9,2);
    z3 = Position1000(9,3);
    [C159(2,1), C159(2,2), C159(2,3), C159(2,4)] = centerCircle3d(x1,y1,z1,x2,y2,z2,x3,y3,z3);
    
    x1 = Position450(2,1);
    y1 = Position450(2,2);
    z1 = Position450(2,3);
    x2 = Position450(6,1);
    y2 = Position450(6,2);
    z2 = Position450(6,3);   
    x3 = Position450(10,1);
    y3 = Position450(10,2);
    z3 = Position450(10,3);
    [C2610(1,1), C2610(1,2), C2610(1,3), C2610(1,4)] = centerCircle3d(x1,y1,z1,x2,y2,z2,x3,y3,z3);
    
    x1 = Position1000(2,1);
    y1 = Position1000(2,2);
    z1 = Position1000(2,3);
    x2 = Position1000(6,1);
    y2 = Position1000(6,2);
    z2 = Position1000(6,3);   
    x3 = Position1000(10,1);
    y3 = Position1000(10,2);
    z3 = Position1000(10,3);
    [C2610(2,1), C2610(2,2), C2610(2,3), C2610(2,4)] = centerCircle3d(x1,y1,z1,x2,y2,z2,x3,y3,z3);

for i = 1:5
    a = 2*i-1;
    Radial450(a,:)=C159(1,1:3)-Position450(a,:);
    Radial1000(a,:)=C159(2,1:3)-Position1000(a,:);
end
for i = 1:5
    b = 2*i;
    Radial450(b,:)=C2610(1,1:3)-Position450(b,:);
    Radial1000(b,:)=C2610(2,1:3)-Position1000(b,:);
end
    
