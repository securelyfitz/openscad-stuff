    translate([3.5,49,4.8])cube([41,18,.2]);

difference(){
    //main body
    translate([-1,-1,-.5])roundedcube(50,110,13.5,5);
    //tigard
    tigard();
    //tigard cutout
    //translate([6,-1,-1])cube([36,49,15]);
    //bitmagic
    translate([3.5,49,4.8])bitmagic();
    //probe clips

    translate([4,108,2.75]){
    translate([20-0,0,-.4])rotate([7.25,0,0]){
        for (i=[-20:5:19]){
            translate([i,0,0])probeclip();
        }
    }
    //probe clip end cutout
    translate([0,-11,-5])cube([40,36,15]);
    //clip notch in bottom
    //translate([0,-25.9,-5])cube([40,3,20]);
}
    //clip top cutout
    translate([4,68,2.5])roundedcube(40,50,12,5);
    //mounting holes
    translate([2,68.5,-2]){
        cylinder(20,2,2,$fn=16);
        translate([44,0,0])cylinder(20,2,2,$fn=16);
    }
    //business card
    translate([3,0,12])roundedcube(42,83,1,.5);
}

module bitmagic(){
    roundedcube(41,18,8,3);
}

module probeclip(){
    rotate([90,0,0])translate([2.5,6,30]){
        //clip long end
        cylinder(h=29,r1=2,r2=1.25,$fn=12);
        //clip triangle middle
        //rotate([0,-90,0])cylinder(h=.5,r=8,$fn=3,center=true);
        translate([2.5,0,0])rotate([0,-90,0])linear_extrude(height=5)polygon(points=[[-7,-7],[-7,7],[5.5,1.25],[5.5,-1.25]]);
        //clip rectangle body
        translate([-2.5,-5,-33])cube([5,10,26]);
    }
}

module tigard(){
    tigardx=48;
    tigardz=13;
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