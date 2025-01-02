difference(){
    translate([-1.5,-1.5,-1.5])roundedcube(50,105,13.5,5);
    tigard();
    translate([3,49,4])bitmagic();
    translate([23.5,130,0]){
        for (i=[-20:5:19]){
            translate([i,0,0])probeclip();
        }
    }
}


module bitmagic(){
    roundedcube(41,18,8,3);
}

module probeclip(){
    rotate([90,0,0])translate([2.5,6,28]){
        cylinder(h=30,r=1.5,$fn=12);
        rotate([0,-90,0])cylinder(h=4.5,r=8,$fn=3,center=true);
        translate([-1.5,-5.5,-28])cube([3,11,24]);
    }
}

module tigard(){
    tigardx=47;
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