// Button class which are essentially the outline for hitboxes of buttons (i.e. "START" button on front page) 
class Button {
  color col; 
  float xPosition; 
  float yPosition;
  float xSize; 
  float ySize; 
  Button(color paraCol, float ParaXPosition, float ParaYPosition, float paraXSize, float paraYSize) {
    col = paraCol; 
    xPosition = ParaXPosition; 
    yPosition = ParaYPosition; 
    xSize = paraXSize; 
    ySize = paraYSize;
  }
  void displayButton() {
    stroke(0); 
    noFill(); 
    //fill(250,0,0); 
    rect(xPosition, yPosition, xSize, ySize);
  }
}
