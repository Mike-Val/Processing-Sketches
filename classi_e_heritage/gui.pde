/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:927306:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button1:927306:

public void dropList1_click1(GDropList source, GEvent event) { //_CODE_:dropList1:816846:
  println("dropList1 - GDropList >> GEvent." + event + " @ " + millis());
} //_CODE_:dropList1:816846:

public void dropList2_click1(GDropList source, GEvent event) { //_CODE_:dropList2:916194:
  println("dropList2 - GDropList >> GEvent." + event + " @ " + millis());
} //_CODE_:dropList2:916194:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  button1 = new GButton(this, 190, 230, 80, 30);
  button1.setText("ok");
  button1.addEventHandler(this, "button1_click1");
  dropList1 = new GDropList(this, 110, 80, 100, 120, 3);
  dropList1.setItems(loadStrings("list_816846"), 0);
  dropList1.addEventHandler(this, "dropList1_click1");
  dropList2 = new GDropList(this, 250, 80, 100, 120, 3);
  dropList2.setItems(loadStrings("list_916194"), 0);
  dropList2.addEventHandler(this, "dropList2_click1");
}

// Variable declarations 
// autogenerated do not edit
GButton button1; 
GDropList dropList1; 
GDropList dropList2; 