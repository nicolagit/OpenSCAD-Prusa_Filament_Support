$fn = 300;

// Base frame
vBsHg = 20;     // height of the Prusa's frame
vBsFm = 5.1;    // thickness of the Prusa's frame
vBsTk = 3;      // thickness of the support
vBsWd = 15;     // width of the support

// Column
vClmHg = 135;   // height from the base
vClmDm = vBsFm+2*vBsTk;    // diameter

// Top hub
vHbDm = 10;     // height of the hub
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
translate([vBsHg+vBsTk,0,0])
        cube([vClmHg,vClmDm,vClmDm/2]);
;

// Top hub
translate([vBsHg+vBsTk+vClmHg,0,0])
        difference() {
            cube([vHbDm,vClmDm,vClmDm/2]);
            translate([vShDm/2,vHbDm/4,0])
                cube([vHbDm,vShDm,vClmDm/2]);
            translate([vShDm/2,vClmDm/2,0])
                cylinder(d=vShDm,h=vClmDm/2);
        }
};
