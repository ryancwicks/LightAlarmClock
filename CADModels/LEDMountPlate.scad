$fn=64;

//***************************************
// Variable Defines

//plate
width=11 * 25.4;
height=8.5 * 25.4;

//mdf dimensions
mdf_thickness = 2;
wall_thickness = 5;
separator_depth = 25.4;

//led dimensions
led_width = 13.1;
led_height = 8.9;
led_hole_separation_width = 9.8;
led_hole_separation_height = 4.8;
led_hole_r = 3.5/2;

led_num_width = 10;
led_num_height = 8;
led_spacing_width = width/(led_num_width+1);
led_spacing_height = height/(led_num_height+1);


//circuit_board_dimansions
board_width=102;
board_height = 78.5;
hole_offset = 3.24; //2.6 inner thread dimension, probably m3
hole_r_clearance = 3.4/2;

//***************************************
// Actions
linear_extrude(mdf_thickness) difference () {
    back_plate();
    board_cutout();
    for (i=[-led_num_width/2:led_num_width/2]) {
        for(j=[-led_num_height/2:led_num_height/2]) {
            translate([i*led_spacing_width, j*led_spacing_height, 0]) led_hole_pattern();
        }
    }
}

difference() {
translate([0, 0, mdf_thickness])
union() {
for (i = [-led_num_height/2+1: led_num_height/2]) {
    translate([-width/2, (i - 1/2)*led_spacing_height-wall_thickness/2, 0]) color("red") horizontal_separator();   
}
for (i = [-led_num_width/2+1: led_num_width/2]) {
    translate([(i - 1/2)*led_spacing_width-wall_thickness/2, -height/2, 0]) color("orange") vertical_separator();
}
}
linear_extrude(1000000) square([5*led_spacing_height+wall_thickness/2, board_height-4*hole_offset], center=true);
}
//***************************************
// Modules

//main cutout
module back_plate () {
    square ([width, height], center=true);
}

//module hole pattern, center is 0.
module led_hole_pattern () {
    union () {
        hull() {
            translate([led_hole_separation_width/2, led_hole_separation_height/2, 0]) circle(r=led_hole_r);
            translate([led_hole_separation_width/2, -led_hole_separation_height/2, 0]) circle(r=led_hole_r);
        }
        translate ([-led_hole_separation_width/2, led_hole_separation_height/2, 0]) circle(r=led_hole_r);
    }
}

//electronics module
module board_cutout () {
    x = board_width/2 - hole_offset;
    y = board_height/2 - hole_offset;
    union() {
        square([board_width-3, board_height-4*hole_offset], center=true);
        for (i= [[x, y, 0], [x, -y, 0], [-x, y, 0], [-x, -y, 0]]) {
            translate(i) circle(r=hole_r_clearance);
        }
    }
}

//Horizontal seperators
module horizontal_separator() {
    translate([0, 0, separator_depth])
    rotate(-90, [1, 0, 0])
    linear_extrude (wall_thickness) {
        difference() {
            square([width, separator_depth]);
            for (i = [1:led_num_width]){
                translate([i*led_spacing_width, 0, 0]) square([wall_thickness, separator_depth], center=true);
            }
        }
    }
}

//Vertical Separator
module vertical_separator() {
    rotate(90, [0, 1, 0])
    rotate(90, [0, 0, 1])
    linear_extrude (wall_thickness) {
        difference() {
            square([height, separator_depth]);
            for (i = [1:led_num_height]){
                translate([i*led_spacing_height, 0, 0]) square([wall_thickness, separator_depth], center=true);
            }
        }
    }
}

