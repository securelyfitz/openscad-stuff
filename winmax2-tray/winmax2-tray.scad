//laptop dimensions
lw=228;
lh=30+10;
ld=160;
//usb dimensions
uw=15;
ud=20;
uh=7;
//usb offset
uow=126;
uoh=lh-18;//12;
uod=ld;
usbscrewoffset=ud/2;
//wall dimensions
w=20;
d=ud;
h=3;

difference(){
    translate([-w,0,0])cube([lw+w+w,ld+d,lh+h]);
    //laptop
    cube([lw,ld,lh]);
    //bottom cutout
    translate([w/2,d/2,h])cube([lw-w,ld-d,lh]);
    //sides cutout
    translate([-w,d,-3*h])cube([lw+2*w,ld-d,lh]);
    //sides cutout
    translate([lw+w/3,d,0])cube([lw+2*w,ld-d,lh]);
    //sides cutout
    translate([-lw-2*w-w/3,d,0])cube([lw+2*w,ld-d,lh]);
    //back cutout
    translate([0,2*d,-3*h])cube([uow-w-w,ld-d,lh]);
    translate([0,ld+d/3,0])cube([uow-w-w,ld-d,lh]);
    //back cutout
    translate([uow+w,2*d,-3*h])cube([lw-uow-w,ld-d,lh]);
    translate([uow+w,ld+d/3,0])cube([lw-uow-w,ld-d,lh]);
    //usb cable
    translate([uow,uod,uoh]){
        cube([uw,ud,uh]);
        translate([uw/2,usbscrewoffset,0])cylinder(d=4,h=100,$fn=60);
    }
    //usb cable
    translate([uow-15,uod,uoh]){
        cube([uw,ud,uh]);
        translate([uw/2,usbscrewoffset,0])cylinder(d=4,h=100,$fn=60);
    }
    //screwholes
    translate([-w/2,d/2,0]){
        cylinder(h=100,d=4,$fn=60);
        translate([0,0,lh/2])cylinder(h=100,d=10,$fn=60);
    }
    translate([-w/2,d/2+ld,0]){
        cylinder(h=100,d=4,$fn=60);
        translate([0,0,lh/2])cylinder(h=100,d=10,$fn=60);
    }
    translate([lw+w/2,d/2,0]){
        cylinder(h=100,d=4,$fn=60);
        translate([0,0,lh/2])cylinder(h=100,d=10,$fn=60);
    }
    translate([lw+w/2,d/2+ld,0]){
        cylinder(h=100,d=4,$fn=60);
        translate([0,0,lh/2])cylinder(h=100,d=10,$fn=60);
    }
    translate([uow-1.5*w,d/2+ld,0]){
        cylinder(h=100,d=4,$fn=60);
        translate([0,0,lh/2])cylinder(h=100,d=10,$fn=60);
    }
}