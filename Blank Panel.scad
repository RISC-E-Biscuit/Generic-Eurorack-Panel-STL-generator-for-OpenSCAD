Resolution = 360; 

//Standards - Do not change.
HP=5.08;
PanelHeight=128.5;
// The Panel

// Thickness of sheet material.
PanelThickness=2;

PanelColor="silver";

HolePoints=16; // Just a default
PanelWidth=HolePoints*HP;

 // Screws inset from edge of panel.
PanelScrewSize=3; // For M3 thread
PanelScrewHoleRadius=(PanelScrewSize/2)+0.2; // Drill 3.2mm to clear M3
PanelScrewHoleSlot=2.54; 
PanelScrewInsetX=5.08; // Variable to needs
PanelScrewInsetY=3; // is this right?

module ScrewSlot(x,y,r,slotlen,res) { // For elongated 
    translate([x-(slotlen/2),y,-1])
    color(PanelColor)
    cylinder(PanelThickness+2,r,r, $fn=res);
    translate([x+(slotlen/2),y,-1])
    color(PanelColor)
    cylinder(PanelThickness+2,r,r, $fn=res);
    translate([x-r,y-r,-1])
    color(PanelColor)
    cube([slotlen,r*2,PanelThickness+2]);
    
}


 difference() {
    translate([0,0,0])
    color(PanelColor)
    cube([PanelWidth-0.2,PanelHeight,PanelThickness]);
     ScrewSlot(PanelScrewInsetX,PanelHeight-PanelScrewInsetY,PanelScrewHoleRadius,PanelScrewHoleSlot,Resolution);
     ScrewSlot(PanelWidth-PanelScrewInsetX,PanelHeight-PanelScrewInsetY,PanelScrewHoleRadius,PanelScrewHoleSlot,Resolution);
    ScrewSlot(PanelScrewInsetX,PanelScrewInsetY,PanelScrewHoleRadius,PanelScrewHoleSlot,Resolution);
    ScrewSlot(PanelWidth-PanelScrewInsetX,PanelScrewInsetY,PanelScrewHoleRadius,PanelScrewHoleSlot,Resolution);
    
}
