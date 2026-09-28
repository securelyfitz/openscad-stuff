w=200;
d=73;
d=50;
h=32;
r=2;

t=5;
l=20;

difference(){
    union(){
        translate([-t,0,0])cube([w+t+t,d,h+t]);
        translate([-t-l,0,0])cube([w+t+t+l+l,d,t]);
    }
    cube([w,d,h]);
    translate([-t-l/2,l/2,0])cylinder(r=r,h=t);
    translate([-t-l/2,d-l/2,0])cylinder(r=r,h=t);
    translate([w+t+l/2,l/2,0])cylinder(r=r,h=t);
    translate([w+t+l/2,d-l/2,0])cylinder(r=r,h=t);
}