$fn = 300;

length = 100;   // central length of the shaft
shDiam = 10;    // main diameter of the shaft
hbDiam = 5;     // diameter of the shaft on the column's hub
xtrlen = 8;     // extra lenght for the hub
stoppr = 5;     // length of the stopper

rotate([-90,0,0]) {
    union() {
        cylinder(d=shDiam,h=length);
        translate([0,0,length]) {
            cylinder(d=hbDiam,h=xtrlen);
        }
        translate([0,0,length+xtrlen]) {
            cylinder(d=shDiam,h=stoppr);
        }
        translate([0,0,-xtrlen]) {
            cylinder(d=hbDiam,h=xtrlen);
        }
        translate([0,0,-xtrlen-stoppr]) {
            cylinder(d=shDiam,h=stoppr);
        }
    }
}
