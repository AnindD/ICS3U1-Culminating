/*  == [Level 1] == 
 Description: Level 1 program, contains all of the methods from back-up with custom obstacles for this level. 
 Author: Anindit Dewan 
 Date: June, 20th, 2022 
 */

// Initialize variables for first level. 
import java.util.Scanner; 
import java.util.Random; 
Scanner input = new Scanner(System.in); 
boolean gameStart = false; 
String value = ""; 
String angleValue = ""; 
int counter = 0; 
int randomGoldenSpot = 1200; 
int randomArea; 
float xCloudPosition = 0; 
float xCloudPosition2 = 1500; 
float xCloudPosition3 = 200; 



void game () {
  PFont arcadeFont = loadFont("Xolonium-16.vlw");
  PFont largerArcadeFont = loadFont("Xolonium-48.vlw"); 

  // Cloud movement which allows clouds to move (not a method because I did not do for other levels). 
  image(Cliff, 0, 200); 
  xCloudPosition += 0.1; 
  xCloudPosition2 += 0.1; 
  xCloudPosition3 += 0.1; 
  image(Grass, 0, 620); 
  image(Cloud, xCloudPosition, 100); 
  image(Cloud, xCloudPosition2, 50);
  image(Cloud, xCloudPosition3, 70);
  if (xCloudPosition > 1600) {
    xCloudPosition = 0;
  }
  if (xCloudPosition2 > 1600) {
    xCloudPosition2 = 0;
  }
  if (xCloudPosition3 > 1600) {
    xCloudPosition3 = 0;
  }

  // Cursor target which using trigonometric ratios will calculate the intitial velocity and angle and display them on the screen. User can press "G" to set the speed based on cursor. 
  // Did not use a method cause the location is different in each level. 
  if ((mouseX > 350 && mouseX < 550) && (mouseY > 0 && mouseY < 250)) {
    double XComponentClicker = (mouseX-350);
    double YComponentClicker = (250-mouseY); 
    int initialVelocityHypotneuse = (int) Math.sqrt((Math.pow(XComponentClicker, 2))+(Math.pow(YComponentClicker, 2)));
    int cursorAngle = (int) Math.toDegrees(Math.atan(YComponentClicker/XComponentClicker)); 
    angleValue = String.valueOf(cursorAngle);
    value = String.valueOf(initialVelocityHypotneuse); 
    strokeWeight(6);
    line(350, 250, mouseX, mouseY);
  }

  // Tells user that you are able to type your velocity and angle in. 
  if (typeVelocity == true) {
    text("Type Velocity has been enabled", 19, 61);
  }
  if (typeAngle == true) {
    text("Type Angle has been enabled", 19, 81);
  }

  // Ball movement methods. 
  strokeWeight(2);
  mainBall.displayBall(); 
  if (startMovement == true) {
    mainBall.moveBall(); 
    mainBall.touchGoldenSpot();  
    if (touchSpot == true) {
      randomArea = rand.nextInt(2); 
      if (randomArea == 1) {
        randomGoldenSpot = rand.nextInt((826-340)+1) + 340;
      } else if (randomArea == 2) {
        randomGoldenSpot = rand.nextInt((1500-1220)+1) + 1220;
      } else {
        randomGoldenSpot = rand.nextInt((1500-1220)+1) + 1220;
      }
      goldenSpot = new goldenSpot(randomGoldenSpot, 620, 100, 10); 
      System.out.println(randomGoldenSpot);
      touchSpot = false;
    }
    mainBall.hitWall(); 
    mainBall.touchGround();
  }

  // Display obstacles and golden spot. 
  firstObstacle.displayObstacle(); 
  image(Obstacle1, 900, 200); 
  goldenSpot.displaySpot(); 

  // Display what your velocity and angle value is. 
  fill(0, 0, 0); 
  textFont(largerArcadeFont); 
  text(counter, 1524, 41); 
  textFont(arcadeFont); 
  text("Enter Initial Velocity (v): " + value + " m/s", 19, 21);
  text("Enter Angle: " + angleValue + "    Degrees", 19, 41);
}
