/*  == [Level 2] == 
 Description: Level 2 program, contains all of the methods from back-up with custom obstacles for this level. 
 Author: Anindit Dewan 
 Date: June, 20th, 2022 
 */

// Initialize variables for second level 
boolean gameTwoStart = false; 
boolean touchSpot2 = false; 
MediumBall mediumBall; 
RectangleObstacle mediumRectangleObstacle1; 
RectangleObstacle mediumRectangleObstacle2; 
RectangleObstacle mediumRectangleObstacle3; 
RectangleObstacle mediumRectangleObstacle4; 
RectangleObstacle mediumRectangleObstacle5;
RectangleObstacle mediumRectangleObstacle6;
RectangleObstacle slab1; 
goldenSpot goldenSpotMedium; 
int randomGoldenSpotMediumX = 1270; 
int randomGoldenSpotMediumY = 512; 
int randomAirResistance = rand.nextInt(3)*-1; 
int lives = 5; 
int score2 = 0; 

void gameTwo () {
  // Load fonts, images 
  PFont desertFont = loadFont("HoboStd-18.vlw"); 
  PFont scoreDesertFont = loadFont("HoboStd-48.vlw"); 
  background(133, 212, 228); 
  image(Sand, 0, 620);   
  // Cursor target which using trigonometric ratios will calculate the intitial velocity and angle and display them on the screen. User can press "G" to set the speed based on cursor. 
  if ((mouseX > 20 && mouseX < 220) && (mouseY > 368 && mouseY < 618)) {
    double XComponentClicker = (mouseX - 20); 
    double YComponentClicker = (618-mouseY); 
    int initialVelocityHypotneuse = (int) Math.sqrt((Math.pow(XComponentClicker, 2))+(Math.pow(YComponentClicker, 2)));
    int cursorAngle = (int) Math.toDegrees(Math.atan(YComponentClicker/XComponentClicker)); 
    angleValue = String.valueOf(cursorAngle);
    value = String.valueOf(initialVelocityHypotneuse);
    strokeWeight(6);
    line(20, 618, mouseX, mouseY);
  }
  fill(0); 
  // Tells user that you are able to type your velocity and angle in. 
  textFont(desertFont); 
  if (typeVelocity == true) {
    text("Type Velocity has been enabled", 19, 82);
  }
  textFont(desertFont); 
  if (typeAngle == true) {
    text("Type Angle has been enabled", 19, 102);
  }

  // Ball movement methods. 
  mediumBall.display(); 
  strokeWeight(2); 
  if (startMovement == true) {
    mediumBall.vectorMove();    
    mediumBall.vectorTouchGoldenSpot(); 
    if (touchSpot2 == true) {
      randomArea = rand.nextInt(2); 
      if (randomArea == 1) {
        randomGoldenSpotMediumX = rand.nextInt((1450-1365)+1) + 1365; 
        randomGoldenSpotMediumY = 608;
      } else if (randomArea == 2) {  
        randomGoldenSpotMediumX = rand.nextInt((1127-800)+1) + 800;
        randomGoldenSpotMediumY = 608;
      } else {
        randomGoldenSpotMediumX = rand.nextInt((1127-800)+1) + 800;
        randomGoldenSpotMediumY = 608;
      }
      goldenSpotMedium = new goldenSpot(randomGoldenSpotMediumX, randomGoldenSpotMediumY, 87, 10); 
      touchSpot2 = false;
    }
    mediumBall.mediumHitWall();
    mediumBall.touchGround();
  } 
  mediumRectangleObstacle1.displayObstacle(); 
  mediumRectangleObstacle2.displayObstacle(); 
  mediumRectangleObstacle3.displayObstacle(); 
  mediumRectangleObstacle4.displayObstacle(); 
  mediumRectangleObstacle5.displayObstacle(); 
  mediumRectangleObstacle6.displayObstacle(); 
  goldenSpotMedium.displaySpot(); 

  // Displays air resistance 
  if (randomAirResistance < 0) {
    fill(0, 0, 0); 
    text("Air Resistance to the left by:     " + randomAirResistance + " m/s", 17, 21);
  } else if (randomAirResistance > 0) {
    fill(0, 0, 0); 
    text("Air Resistance to the right by: " + randomAirResistance + " m/s", 17, 21);
  } else {
    fill(0, 0, 0); 
    text("No Air Resistance", 17, 21);
  }

  //Display what your velocity and angle value is.  
  textFont(desertFont); 
  text("Enter Initial Velocity (v):           " + value + " m/s", 17, 42);
  text("Enter Angle:                               " + angleValue + "    Degrees", 17, 62); 
  textFont(scoreDesertFont); 
  text(score2, 1550, 60); 

  // Load images 
  image(Pillar, 435, 259); 
  image(DesertWall, 1174, 250); 
  image(DesertWall2, 1527, 137);
}
