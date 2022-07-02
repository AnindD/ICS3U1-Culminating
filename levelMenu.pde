
/*  == [Level Menu] == 
Description: Menu that contains the 3 main levels. 
Author: Anindit Dewan 
Date: June, 20th, 2022 
*/

boolean levelStart = false; 
PImage levelMenu; 
Button levelButton;
Button moderateButton; 
Button hardButton;

void levelMenu() {
  background(250, 250, 250); 
  image(levelMenu, 0, 0); 
  levelButton = new Button(color(250, 0, 0), 0, 523, 528, 180);
  moderateButton = new Button(color(250, 0, 0), 533, 523, 505, 180);
  hardButton = new Button(color(250, 0, 0), 1045, 523, 555, 180); 
  levelButton.displayButton(); 
  moderateButton.displayButton(); 
  hardButton.displayButton();
}
