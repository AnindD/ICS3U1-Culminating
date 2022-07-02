
/*  == [Start Menu] == 
 Description: Start menu program seen when user opens the screen. 
 Author: Anindit Dewan 
 Date: June, 20th, 2022 
 */

Button startButton; 
Button quitButton;  
boolean mainStart = true; 

void startMenu () {
  background(250, 250, 250);
  startButton = new Button(color(250, 250, 250), 90, 260, 206, 65); 
  startButton.displayButton(); 
  quitButton = new Button(color(250, 250, 250), 90, 345, 206, 65); 
  quitButton.displayButton(); 
  image(StartMenu, 0, 0);
}
