$fn=32;

module PCB(){
    translate([0,0,5]) union(){
        difference(){
            cube([72,50,12]);
            translate([3.5,13.5,0]) cylinder(h=20,d=3);
            translate([2,44,0]) cylinder(h=20,d=3);
            translate([61.5,3,0]) cylinder(h=20,d=3);
        }
        translate([60,50,0]) rotate([-90,0,0]) cylinder(h=14,d=5);
    }
}

module power_board(){
    cube([50,15,20]);
}

module ESP_and_power(){
    cube([50,50,10]);
}

module ESPmount(){
    difference(){
        cube([18+2,15+4,22.5+5]);
        translate([2,2,22.5])cube([25,15,5]);
    }
}  

module powerBoard(){
     difference(){
        cube([50+2,15+4,5]);
        translate([0,2,2])cube([50,15,5]);
    }   
}


module case_main(){
    difference(){
        union(){
            difference(){
                cube([80+60,80+20,40]);
                translate([2,2,2]) cube([76+60,76+20,40]);
            }
            translate([4,4,0]) cylinder(h=40, d=8);
            translate([140-4,4,0]) cylinder(h=40, d=8);
            translate([4,100-4,0]) cylinder(h=40, d=8);
            translate([140-4,100-4,0]) cylinder(h=40, d=8);
            
            translate([2,30,1.5]) powerBoard();
            translate([10,5,1.5]) ESPmount(); 
            
            translate([2+4+55,2+4,1]) difference(){
                translate([3.5,13.5,0]) cylinder(h=7,d=5);
                translate([3.5,13.5,0]) cylinder(h=7,d=1);
            }  
            translate([2+4+55,2+4,1]) difference(){
                translate([2,44,0]) cylinder(h=7,d=5);
                translate([2,44,0]) cylinder(h=7,d=1);
            }
            translate([2+4+55,2+4,1]) difference(){
                translate([61.5,3,0]) cylinder(h=7,d=5);
                translate([61.5,3,0]) cylinder(h=7,d=1);            
            }
            difference(){
                #translate([95,80,1]) cylinder(h=6,d=30+4);
                translate([95,80,2]) cylinder(h=5,d=30);
            }
            
              
            
        }
        translate([-5,65,20])rotate([0,90,0]) cylinder(h=10,d=12);
        
        translate([15,5+80,0]) cylinder(h=10,d=12);
        translate([40,5+80,0]) cylinder(h=10,d=12);
        translate([65,5+80,0]) cylinder(h=10,d=12);
        
        translate([15,65,0]) cylinder(h=10,d=5);
        translate([40,65,0]) cylinder(h=10,d=5);
        translate([65,65,0]) cylinder(h=10,d=5);
        
        translate([95,80,-10]) cylinder(h=50,d=5);
        translate([105,80,-10]) cylinder(h=50,d=5);
        translate([85,80,-10]) cylinder(h=50,d=5);
        translate([95,70,-10]) cylinder(h=50,d=5);
        translate([95,90,-10]) cylinder(h=50,d=5);
    
        translate([4,4,-5]) cylinder(h=50, d=4.5);
        #translate([4,4,2]) cylinder(h=1.75,d1=8,d2=4.5);
        #translate([4,4,0])cylinder(h=2,d=8);
        translate([140-4,4,-5]) cylinder(h=50, d=4.5);
        #translate([140-4,4,2]) cylinder(h=1.75,d1=8,d2=4.5);
        #translate([140-4,4,0])cylinder(h=2,d=8);        
        translate([4,100-4,-5]) cylinder(h=50, d=4.5);                    
        #translate([4,100-4,2]) cylinder(h=1.75,d1=8,d2=4.5);
        #translate([4,100-4,0])cylinder(h=2,d=8);        
        translate([140-4,100-4,-5]) cylinder(h=50, d=4.5);  
        #translate([140-4,100-4,2]) cylinder(h=1.75,d1=8,d2=4.5);
        #translate([140-4,100-4,0])cylinder(h=2,d=8);        
    }
}

module lid(){
    difference(){
        cube([80+60,80+20,2]);
        translate([4,4,-2]) cylinder(h=5, d=4.5);
        translate([140-4,4,-2]) cylinder(h=5, d=4.5);
        translate([4,100-4,-2]) cylinder(h=5, d=4.5); 
        translate([140-4,100-4,-2]) cylinder(h=5, d=4.5); 
    }        
}
            
            
            
case_main();
//lid();

translate([2+4+55,2+4,2]) PCB();
//translate([2+5,2+5,2+5]) ESP_and_power();
//#translate([2+25+5,60,2]) power_board();