Resolution = 36; 
color([0.6,0.6,0.6]);  

//Standards
HP=5.08;

// The Panel

// Thickness of sheet material.
PanelThickness=2;

// Eurorack standard
PanelHeight=128.5; 
// Eurorack standard
HolePoints=16;
PanelWidth=HolePoints*HP;
 // Screws inset from edge of panel.
PanelScrewSize=3; // M3 thread
PanelScrewHoleRadius=(PanelScrewSize/2)+0.2; // Drill 3.2mm to clear M3
PanelScrewHoleSlot=2.54;
PanelScrewInsetX=5.08; 
PanelScrewInsetY=5;

CoTextX=20;

module ScrewSlot(x,y,r,slotlen,res) { // For elongated screw holes.

    //Left hole
    translate([x-(slotlen/2),y,-1])
    color("black")
    cylinder(PanelThickness+2,r,r, $fn=res);

    //Right hole
    translate([x+(slotlen/2),y,-1])
    color("black")
    cylinder(PanelThickness+2,r,r, $fn=res);

    //Slot
    translate([x-r,y-r,-1])
    color("black")
    cube([slotlen,r*2,PanelThickness+2]);
    
}


 difference() {
     // The Panel
    translate([0,0,0])
    color("black")
    cube([PanelWidth,PanelHeight,PanelThickness]);
      
   
     
    //Top Left Panel Screw
    translate([PanelScrewInsetX-(PanelScrewHoleSlot/2),PanelHeight-PanelScrewInsetY,-1])
    color("black")
    cylinder(PanelThickness+2,PanelScrewHoleRadius,PanelScrewHoleRadius, $fn=Resolution);
     translate([PanelScrewInsetX+(PanelScrewHoleSlot/2),PanelHeight-PanelScrewInsetY,-1])
    color("black")
    cylinder(PanelThickness+2,PanelScrewHoleRadius,PanelScrewHoleRadius, $fn=Resolution);
     translate([PanelScrewInsetX-(PanelScrewHoleSlot/2),PanelHeight-PanelScrewInsetY-PanelScrewHoleRadius,-1])
    color("black")
     cube([PanelScrewHoleSlot,PanelScrewHoleRadius*2,PanelThickness+2]);
    
    //Top Right Panel Screw
     ScrewSlot(PanelWidth-PanelScrewInsetX,PanelHeight-PanelScrewInsetY,PanelScrewHoleRadius,PanelScrewHoleSlot,Resolution);
     //translate([PanelWidth-PanelScrewInsetX,PanelHeight-PanelScrewInsetY,-1])
    //color("black")
        //cylinder(PanelThickness+2,PanelScrewHoleRadius,PanelScrewHoleRadius, $fn=Resolution );
    
    //Bottom Left Panel Screw
    ScrewSlot(PanelScrewInsetX,PanelScrewInsetY,PanelScrewHoleRadius,PanelScrewHoleSlot,Resolution);
    

    //Bottom Right Panel Screw
    ScrewSlot(PanelWidth-PanelScrewInsetX,PanelScrewInsetY,PanelScrewHoleRadius,PanelScrewHoleSlot,Resolution);
    
//the text
    translate([CoTextX, 4,1.99]) 
    {
    color("white")
    linear_extrude(height=0.02) 
    text("Put Your Synth Name Here",size=3,font="Liberation Mono:style=Bold",$fn=Resolution); 
    }
}