difference(){
    union(){
            translate([-1,-1,-1])roundedcube(50,112,13,5);//main body
//        translate([-1,-1,-1])roundedcube(50,50,13,5);//main body
    translate([-1,-1,-1])roundedcube(70,112,13,5);//main body

    }
    tigard();//tigard

    translate([3.5,49,5])bitmagic();//bitmagic
    translate([24,110,4])    rotate([9,0,0]){
        for (i=[-20:5:19]){
            translate([i,0,0])probeclip();//clips
        }
    }
    translate([4,68,5])roundedcube(40,50,8,5);//clip cutout
    translate([2,68.5,-2]){
//        cylinder(20,2,2,$fn=16);
        translate([44,0,0])        cylinder(20,2,2,$fn=16);
    }
    translate([1,57,1])
        cube([2.5,20,15]);
    translate([-1,57,1])
        cube([4,3,15]);
    translate([-1,74,1])
        cube([4,3,15]);
    translate([49,-1,0])
        cube([17,112,13]);
}


module bitmagic(){
    roundedcube(41,18,8,3);
}

module probeclip(){
    rotate([90,0,0])translate([2.5,6,28]){
        cylinder(h=33,r1=2,r2=1.25,$fn=12);
        rotate([0,-90,0])cylinder(h=4.5,r=8,$fn=3,center=true);
        translate([-2.5,-7,-30])cube([5,14,26]);
    }
}

module tigard(){
    tigardx=48;
    tigardz=12;
    cutoutx=6;
    cutoutz=1.5;
    radius=3;

    difference(){
        roundedcube(tigardx,tigardx,tigardz,radius);
        intersection(){
            cube([tigardx,tigardx,cutoutz]);
            translate([-cutoutx,-cutoutx,0]){
                roundedcube(cutoutx*2,cutoutx*2,cutoutz,radius);
                translate([tigardx,tigardx,0])roundedcube(cutoutx*2,cutoutx*2,cutoutz,radius);
                translate([tigardx,0,0])roundedcube(cutoutx*2,cutoutx*2,cutoutz,radius);
                translate([0,tigardx,0])roundedcube(cutoutx*2,cutoutx*2,cutoutz,radius);
            }
        }
    }
}


module roundedcube(xx, yy, height, radius) {

difference(){

    cube([xx,yy,height]);

    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }
    translate([xx,0,0])
    rotate(90)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }

    translate([xx,yy,0])
    rotate(180)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }

    translate([0,yy,0])
    rotate(270)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }
}
}