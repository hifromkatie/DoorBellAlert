$fn=32;

module front(){
    difference(){
        cube([160,65,27]);
        translate([(160-90)/2,(65-55)/2,-1])cube([90,55,28]);
        translate([((160-99)/2)+3,(65-59)/2,2])cube([99,59,28]);
        
        translate([20+((160-99)/2)+3,0,-2+14])cube([65,60,15]);
        //translate([76.5-7.5+((160-90)/2)-3,((65-53)/2)-10,-2+14])cube([15,10,15]);
        translate([((160-90)/2)/2,65/2,10]) union(){
            #cylinder(h=1.75,d1=8,d2=4.5);
            #translate([0,0,-10])cylinder(h=10,d=8);
            #translate([0,0,1.75])cylinder(h=20,d=4.5);
        }
        
        translate([160-((160-90)/2)/2,65/2,10]) union(){
            #cylinder(h=1.75,d1=8,d2=4.5);
            #translate([0,0,-10])cylinder(h=10,d=8);
            #translate([0,0,1.75])cylinder(h=20,d=4.5);
            
        }
    }
        
}

module back(){
    difference(){
        union(){
            cube([160,65,3]);
            translate([58,7.5,3]) cylinder(h=2,d=5);
            translate([160-43.5,7.5,3]) cylinder(h=2,d=5);
            translate([58,65-8,3]) cylinder(h=2,d=5);
            translate([160-43.5,65-8,3]) cylinder(h=20,d=5);
        }
        translate([58,7.5,0])cylinder(h=10,d=3);
        translate([160-43.5,7.5,0])cylinder(h=10,d=3);
        translate([58,65-8,0])cylinder(h=10,d=3);
        translate([160-43.5,65-8,0])cylinder(h=10,d=3);
        
        #translate([((160-90)/2)/2,65/2,0])cylinder(h=20,d=4.5);
        translate([160-((160-90)/2)/2,65/2,0])cylinder(h=20,d=4.5);
    }
}

//front();
back();