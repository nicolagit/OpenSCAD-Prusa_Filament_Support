$fn = 300;

// Base frame
vBsHg = 20;     // height of the Prusa's frame
vBsFm = 3;      // thickness of the Prusa's frame
vBsTk = 3;      // thickness of the support
vBsWd = 15;     // width of the support

// Column
vClmHg = 135;   // height from the base
vClmDm = vBsFm+2*vBsTk;    // diameter

// Top hub
vHbDm = vClmDm; // top diameter of the column
vShDm = 6;      // internal diameter for the shaft

union() {
// Base support
difference() {
    cube([vBsHg+vBsTk, vBsFm+2*vBsTk, vBsWd]);
    translate([0,vBsTk,0])
        cube([vBsHg,vBsFm,vBsWd])
    ;
};
// Column
translate([vBsHg+vBsTk,vBsFm/2+vBsTk,vClmDm/2])
    rotate([0,90,0])
        cylinder(d=vClmDm,h=vClmHg)
;

// Top hub
translate([vBsHg+vBsTk+vClmHg,vBsFm/2+vBsTk,(vClmDm/2)-((vClmDm-vHbDm)/2)])
//    scale([1,1,.5])
        difference() {
            rotate([0,90,0])
                cylinder(d=vHbDm,h=vShDm);
            translate([0,-vHbDm/2, -vHbDm/2])
                cube([vHbDm,vHbDm,vHbDm/2]);
            translate([vShDm,0,-vHbDm/2])
                cylinder(d=vShDm,h=vHbDm);
        }
};
