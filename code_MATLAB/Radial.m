for i = 1:6
    a=10*i-9;
    x1 = Position(a,1);
    y1 = Position(a,2);
    z1 = Position(a,3);
    x2 = Position(a+4,1);
    y2 = Position(a+4,2);
    z2 = Position(a+4,3);   
    x3 = Position(a+8,1);
    y3 = Position(a+8,2);
    z3 = Position(a+8,3);
    [C159(i,1), C159(i,2), C159(i,3), C159(i,4)] = centerCircle3d(x1,y1,z1,x2,y2,z2,x3,y3,z3);
    
    b=10*i-8;
    X1 = Position(b,1);
    Y1 = Position(b,2);
    Z1 = Position(b,3);
    X2 = Position(b+4,1);
    Y2 = Position(b+4,2);
    Z2 = Position(b+4,3);   
    X3 = Position(b+8,1);
    Y3 = Position(b+8,2);
    Z3 = Position(b+8,3);
    [C2610(i,1), C2610(i,2), C2610(i,3), C2610(i,4)] = centerCircle3d(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3);
    
end

for ii= 1:6
    
    R1=C159(ii,1:3);
    aa = ii*10-9;
    Vector(aa,:)=R1(1,:)-Position(aa,:);
    Vector(aa+2,:)=R1(1,:)-Position(aa+2,:);
    Vector(aa+4,:)=R1(1,:)-Position(aa+4,:);
    Vector(aa+6,:)=R1(1,:)-Position(aa+6,:);
    Vector(aa+8,:)=R1(1,:)-Position(aa+8,:);
    
    R2=C2610(ii,1:3);
    bb = ii*10-8;
    Vector(bb,:)=R2(1,:)-Position(bb,:);
    Vector(bb+2,:)=R2(1,:)-Position(bb+2,:);
    Vector(bb+4,:)=R2(1,:)-Position(bb+4,:);
    Vector(bb+6,:)=R2(1,:)-Position(bb+6,:);
    Vector(bb+8,:)=R2(1,:)-Position(bb+8,:);
end
