// Free Generic Eurorack Blank Panel STL Generator for OpenSCAD
// Allows menu customisation of width in HP, Material thickness, screw slot centre
// distances from edge of panel, and slot lenths from round, to "much too long".
// Freeware (c) Neko Mittz 2022 
// No warranties of any kind whatsoever.
// To Dos:
// M2.5+0.2 clearance option and spacing for eurocard front panels.
// Number of screws option (perhaps auto based on width?) with auto-spacing on 5.08mm

Resolution = 360;         // Configure Low (18) for fast test rendering, high (360) for final render.
PanelColor="silver";      // Configurable option, mostly irrelevant.
PanelSizeInHolepoints=20; // Works best in 5 to 24 HP, this will be improved.
MaterialThickness=2;      // 3mm is nice too.
PanelScrewInsetX=5.08;    // Variable to needs
PanelScrewHoleSlot=2.54;  //0 for circular hole.



// Generate a screwhole/slot.
module ScrewSlot(x,y,r,thickness,slotlen,slotcolour,res) { 
    translate([x-(slotlen/2),y,-1])
    color(slotcolour)
    cylinder(thickness+2,r,r, $fn=res);
    translate([x+(slotlen/2),y,-1])
    color(slotcolour)
    cylinder(thickness+2,r,r, $fn=res);
    translate([(x-(slotlen/2)),y-r,-1])
    color(slotcolour)
    cube([slotlen,r*2,thickness+2]);
}

// Generate a panel 
module Panel(HolePoints,PanelThickness,SlotLength,Colour) { 
    PanelHeight=128.5;//Standards - Do not change.
    HP=5.08; //Standards - Do not change
    PanelScrewSize=3; // For M3 thread
    PanelScrewHoleRadius=(PanelScrewSize/2)+0.2; // Drill 3.2mm to clear M3
    PanelScrewInsetY=3; // Screws insets from edges of panel.
    PanelWidth=HolePoints*HP;
    
    difference() {
        translate([0,0,0])
        color(Colour)
        cube([PanelWidth-0.2,PanelHeight,PanelThickness]);
        ScrewSlot(PanelScrewInsetX,PanelHeight-PanelScrewInsetY,PanelScrewHoleRadius,PanelThickness,SlotLength,Colour,Resolution);
        ScrewSlot(PanelWidth-PanelScrewInsetX,PanelHeight-PanelScrewInsetY,PanelScrewHoleRadius,PanelThickness,SlotLength,Colour,Resolution);
        ScrewSlot(PanelScrewInsetX,PanelScrewInsetY,PanelScrewHoleRadius,PanelThickness,SlotLength,Colour,Resolution);
        ScrewSlot(PanelWidth-PanelScrewInsetX,PanelScrewInsetY,PanelScrewHoleRadius,PanelThickness,SlotLength,Colour,Resolution);
    }
}

Panel(PanelSizeInHolepoints,MaterialThickness,PanelScrewHoleSlot,PanelColor);
