/*  == [Backend] == 
 Description: Backend with the templates (classes) and the methods. 
 Author: Anindit Dewan 
 Date: June, 20th, 2022 
 */
// Initialize variables that will be used in all of the back-end. 
import java.util.Random;
Random rand = new Random(); 
int rad = 50; 
int realRad = 25; 

// The ball/projectile of the game which the user will throw around. 
class Ball {
  color col; 
  float xPosition; 
  float yPosition; 
  float xSpeed; 
  float ySpeed; 
  float NonChangingXSpeed; 
  float NonChangingYSpeed; 
  double finalYSpeed;

  Ball(color paraCol, float paraXPosition, float paraYPosition, float paraXSpeed, float paraYSpeed) {
    col = paraCol; 
    xPosition = paraXPosition; 
    yPosition = paraYPosition; 
    xSpeed = paraXSpeed; 
    ySpeed = paraYSpeed; 
    NonChangingXSpeed = paraXSpeed; 
    NonChangingYSpeed = paraYSpeed;
  }
  void displayBall() {
    stroke(0); 
    fill(col); 
    ellipse(xPosition, yPosition, rad, rad);
  }
  // Will move the ball in the x direction at specified speed and will have an acceleration of 9.8 pixels per second squared. 
  void moveBall() {
    yPosition = yPosition + ySpeed; 
    ySpeed = ySpeed + 9.8; 
    xPosition = xPosition + xSpeed;
  }
  void booleanMove() {
    if (yPosition != 960) {
      startMovement = true;
    }
  }
  // Allows user to restart the ball in the original position. 
  void restart() {
    ballRelease = true; 
    startMovement = false; 
    yPosition = 235; 
    xPosition = 350; 
    ySpeed = NonChangingYSpeed; 
    xSpeed = NonChangingXSpeed;
  }
  // When user touches the ground the ball's speed is stopped and the speed is saved into an array. 
  void touchGround() {
    if (yPosition > 620) {
      startMovement = false; 
      finalYSpeed = ySpeed; 
      finalVelocityArray[arrayIndex] = (double) ySpeed; 
      xSpeed = 0; 
      ySpeed = 0; 
      yPosition = 600; 
      ballRelease = false;
    }
  }
  //  Same procedure as touching the ground (see above), but will add one to the score/counter. 
  void touchGoldenSpot() {
    if ((xPosition > randomGoldenSpot && xPosition < randomGoldenSpot+100) && (yPosition > 600)) {
      startMovement = false;
      finalYSpeed = ySpeed; 
      finalVelocityArray[arrayIndex] = (double) ySpeed; 
      ySpeed = 0; 
      xSpeed = 0;
      yPosition = 600; 
      counter = counter + 1; 
      touchSpot = true;  
      ballRelease = false;
    }
  }
  // Method will set the speed of the ball based on manually typing it in or on the position of the cursor. 
  public void setSpeed() {
    if (value.length() > 0) {
      Double totalSpeed = Double.parseDouble(value); 
      System.out.println(totalSpeed); 
      velocityArray[arrayIndex] = totalSpeed; 
      if (angleValue == "") {
        ;
      } else {
        angle = Double.parseDouble(angleValue);
      }
      angle = Math.toRadians(angle); 
      xSpeed = Float.valueOf(String.valueOf((totalSpeed)*(Math.cos(angle)))); 
      ySpeed = Float.valueOf(String.valueOf((totalSpeed)*(Math.sin(angle))))*-1; 
      if (angle == 0) {
        ySpeed = 0;
      } 
      NonChangingXSpeed = xSpeed; 
      NonChangingYSpeed = ySpeed;
      velocityYArray[arrayIndex] = (int) (ySpeed*-1); 
      angleArray[arrayIndex] = angle; 
      arrayIndex++;
    }
  }
  // When ball hits a wall then the speed will be changed into the opposite direction, creating a bounce. 
  void hitWall() {
    if ((xPosition > 900-rad+30 && xPosition < 1000) && (yPosition > 220)) {
      xSpeed = xSpeed * -1; 
      ySpeed = ySpeed * -1;
    }
    if ((xPosition > 930-rad+30 && xPosition < 1000) && (yPosition > 200 && yPosition < 210)) {
      xSpeed = 0; 
      ySpeed = 0; 
      startMovement = false; 
      yPosition = 175;
    }
  }
}

// Template which will show the outlines of hitboxes. 
class RectangleObstacle {
  color col; 
  float xPosition; 
  float yPosition; 
  float lengths; 
  float widths; 
  RectangleObstacle(color paraCol, float paraXPosition, float paraYPosition, float paralengths, float parawidths) {
    col = paraCol; 
    xPosition = paraXPosition; 
    yPosition = paraYPosition; 
    lengths = paralengths; 
    widths = parawidths;
  }
  void displayObstacle() {
    noStroke(); 
    noFill(); 
    rect(xPosition, yPosition, lengths, widths);
  }
}

// Template which will create the golden spot based on the size of the spot. 
class goldenSpot {
  float xPosition; 
  float yPosition; 
  float lengths; 
  float widths; 
  float ySpeed = 5; 
  goldenSpot(float paraXPosition, float paraYPosition, float paralengths, float parawidths) {
    xPosition = paraXPosition; 
    yPosition = paraYPosition; 
    lengths = paralengths; 
    widths = parawidths;
  }
  void displaySpot() {
    stroke(0); 
    fill(255, 215, 0); 
    rect(xPosition, yPosition, lengths, widths);
  }
  // Method which will move the object in a direction, useful for level 3 where golden spot is moving. 
  void moveGoldenSpot() {
    yPosition = yPosition - (ySpeed); 
    if (yPosition < 0) {
      ySpeed = ySpeed*-1;
    }
    if (yPosition > 619) {
      ySpeed = ySpeed*-1;
    }
  }
  float returnPosition() {
    return yPosition;
  }
}



// Ball for medium mode, different class as there will be new features onto the ball (i.e. air resistance). 
class MediumBall {
  PVector location; 
  PVector velocity; 
  PVector acceleration; 
  PVector airResistance; 
  float NonChangingXSpeed = 39;  
  float NonChangingYSpeed = -42; 
  MediumBall() {
    location = new PVector(20, 600); 
    velocity = new PVector(39, -42);
    acceleration = new PVector(0, 4);
    airResistance = new PVector(randomAirResistance, 0);
  }
  // Will move the ball in the x direction at specified speed and will have an acceleration of 9.8 pixels per second squared ALONG with air resistance going in a randomly generated negative position. 
  void vectorMove() {
    velocity.add(airResistance); 
    velocity.add(acceleration); 
    location.add(velocity);
  }
  // Touch ground is same as Ball() class, see above.  
  void touchGround() {
    if (location.y > 620) {
      finalVelocityArrayMedium[arrayIndexMedium] = (double) velocity.y; 
      location.y = 600; 
      velocity.x = 0; 
      velocity.y = 0;  
      acceleration.y = 0; 
      ballRelease = false; 
      startMovement = false;
    }
  }
  void booleanVectorMove() {
    startMovement = true;
  }
  // Restart is same as Ball() class, see above. 
  void vectorRestart() {
    ballRelease = true; 
    startMovement = false; 
    location.x = 20; 
    location.y = 600; 
    velocity.x = NonChangingXSpeed; 
    velocity.y = NonChangingYSpeed;  
    acceleration.y = 4;
  }
  // Touch golden spot is same as Ball() class, see above. 
  void vectorTouchGoldenSpot() {
    if ((location.x > randomGoldenSpotMediumX && location.x < randomGoldenSpotMediumX+87) && (location.y > randomGoldenSpotMediumY)) {
      touchSpot2 = true; 
      startMovement = false; 
      finalVelocityArrayMedium[arrayIndexMedium] = (double) velocity.y; 
      velocity.x = 0; 
      velocity.y = 0; 
      location.x = -100; 
      location.y = -100; 
      ballRelease = false; 
      score2++;
    }
  }
  void display() {
    stroke(0); 
    strokeWeight(2); 
    fill(250); 
    ellipse(location.x, location.y, rad, rad);
  }
  // Hidden easter egg which allows you to automatically win the game. 
  void autoWin() {
    location.x = randomGoldenSpotMediumX+20; 
    location.y = randomGoldenSpotMediumY-20;
  }
  // Set speed is same as Ball() class, see above. 
  void setVectorSpeed() {
    if (value.length() > 0) {
      Double totalSpeed = Double.parseDouble(value); 
      if (angleValue == "") {
        ;
      } else {
        angle = Double.parseDouble(angleValue);
      }
      angle = Math.toRadians(angle); 
      velocityArrayMedium[arrayIndexMedium] = totalSpeed;
      velocity.x = Float.valueOf(String.valueOf((totalSpeed)*(Math.cos(angle)))); 
      velocity.y = Float.valueOf(String.valueOf((totalSpeed)*(Math.sin(angle))))*-1; 
      if (angle == 0) {
        velocity.y = 0;
      } 
      NonChangingXSpeed = velocity.x; 
      NonChangingYSpeed = velocity.y; 
      velocityYArrayMedium[arrayIndexMedium] = (int) (velocity.y*-1); 
      angleArrayMedium[arrayIndexMedium] = angle; 
      arrayIndexMedium++;
    }
  }
  void mediumHitWall() {
    // Hit boxes for medium mode. 
    // Right-side rectangular wall 
    if ((location.x > 1525-realRad && location.x < 1625+realRad) && (location.y > 130-realRad && location.y < 620+realRad)) {
      velocity.x = -10; 
      velocity.y = velocity.y*-1;
    }  
    // Left-side rectangular wall 
    if ((location.x > 1173-realRad && location.x < 1212+realRad) && (location.y > 245-realRad && location.y < 620+realRad)) {
      velocity.x = -39; 
      velocity.y = velocity.y*-1;
    }
    if ((location.x > 1212-realRad && location.x < 1268+realRad) && (location.y > 245-realRad && location.y < 620+realRad)) {
      velocity.x = 39; 
      velocity.y = velocity.y*-1;
    }
    // Top of pillar structure 
    if ((location.x > 436-realRad && location.x < 608+realRad) && (location.y > 261-realRad && location.y < 330+realRad)) {
      velocity.x = -39; 
      velocity.y = velocity.y*-1;
    }
    if ((location.x > 608-realRad && location.x < 795+realRad) && (location.y > 261-realRad && location.y < 330+realRad)) {
      velocity.x = 39; 
      velocity.y = velocity.y*-1;
    }
    // Middle of pillar structure  
    if ((location.x > 457-realRad && location.x < 618+realRad) && (location.y > 334-realRad && location.y < 540+realRad)) {
      velocity.x = -39; 
      velocity.y = velocity.y*-1;
    }
    if ((location.x > 618-realRad && location.x < 790+realRad) && (location.y > 334-realRad && location.y < 540+realRad)) {
      velocity.x = 39; 
      velocity.y = velocity.y*-1;
    }
    // Bottom of pillar structure 
    if ((location.x > 436-realRad && location.x < 608+realRad) && (location.y > 543-realRad && location.y < 618+realRad)) {
      velocity.x = -39; 
      velocity.y = velocity.y*-1;
    }
    if ((location.x > 608-realRad && location.x < 795+realRad) && (location.y > 543-realRad && location.y < 618+realRad)) {
      velocity.x = 39; 
      velocity.y = velocity.y*-1;
    }
  }
}


// Ball for medium mode, different class as there will be new features onto the ball (i.e. moving golden spot). 
class HardBall {
  PVector location; 
  PVector velocity; 
  PVector acceleration; 
  PVector airResistance; 

  float NonChangingXSpeed = 39; 
  float NonChangingYSpeed = -42; 
  HardBall() {
    location = new PVector(20, 228); 
    velocity = new PVector(39, -42);
    acceleration = new PVector(0, 4);
    airResistance = new PVector(randomAirResistance, 0);
  }
  // Allows ball to move with velocity and air resistance. 
  void hardMove() {
    velocity.add(acceleration); 
    velocity.add(airResistance); 
    location.add(velocity);
  }
  void hardTouchGround() {
    if (location.y > 620) {
      finalVelocityArrayHard[arrayIndexHard] = (double) velocity.y; 
      location.y = 600; 
      velocity.x = 0; 
      velocity.y = 0; 
      acceleration.y = 0; 
      ballRelease = false; 
      startMovement = false;
    }
  }
  void booleanHardMove() {
    startMovement = true;
  }
  void display() {
    stroke(0); 
    strokeWeight(2); 
    fill(250); 
    ellipse(location.x, location.y, rad, rad);
  }
  // Restart is same as Ball() class, see above. 
  void hardBallRestart() {
    ballRelease = true; 
    startMovement = false; 
    location.x = 20; 
    location.y = 228; 
    velocity.x = NonChangingXSpeed; 
    velocity.y = NonChangingYSpeed; 
    acceleration.y = 4;
  }
  // Touch golden spot is same as Ball() class, see above. 
  void hardTouchGoldenSpot() {
    if ((location.x > randomGoldenSpotHardX-realRad && location.x < randomGoldenSpotHardX+realRad+87) && (location.y > yGoldenValue) && (location.y < yGoldenValue+100)) {
      location.x = -100; 
      location.y = -100; 
      touchSpot3 = true; 
      startMovement = false; 
      finalVelocityArrayHard[arrayIndexHard] = (double) velocity.y; 
      velocity.x = 0; 
      velocity.y = 0; 
      ballRelease = false; 
      score3++;
    }
  }
  // Set speed is same as Ball() class, see above. 
  void hardSetVectorSpeed() {
    if (value.length() > 0) {
      Double totalSpeed = Double.parseDouble(value); 
      if (angleValue == "") {
        ;
      } else {
        angle = Double.parseDouble(angleValue);
      }
      angle = Math.toRadians(angle); 
      velocityArrayHard[arrayIndexHard] = totalSpeed;
      velocity.x = Float.valueOf(String.valueOf((totalSpeed)*(Math.cos(angle)))); 
      velocity.y = Float.valueOf(String.valueOf((totalSpeed)*(Math.sin(angle))))*-1; 
      if (angle == 0) {
        velocity.y = 0;
      } 
      NonChangingXSpeed = velocity.x; 
      NonChangingYSpeed = velocity.y; 
      velocityYArrayHard[arrayIndexHard] = (int) (velocity.y*-1); 
      angleArrayHard[arrayIndexHard] = angle; 
      arrayIndexHard++;
    }
  }
  // Hitboxes for hard mode 
  void hardTouchWall() {
    // Statue 
    if ((location.x > 599-realRad && location.x < 670+realRad) && (location.y > 162-realRad && location.y < 443+realRad)) {
      velocity.x = -39; 
      velocity.y = velocity.y-1;
    }
    if ((location.x >= 670-realRad && location.x < 740+realRad) && (location.y > 162-realRad && location.y < 443+realRad)) {
      velocity.x = 39; 
      velocity.y = velocity.y-1;
    }
    // Statue pillar 
    if ((location.x > 590-realRad && location.x < 675+realRad) && (location.y > 442-realRad && location.y < 619+realRad)) {
      velocity.x = -39; 
      velocity.y = velocity.y*-1;
    }
    if ((location.x >= 675 && location.x < 759) && (location.y > 442-realRad && location.y < 619+realRad)) {
      velocity.x = 39; 
      velocity.y = velocity.y*-1;
    }
    // Stack of crates 
    if ((location.x > 0-realRad && location.x < 100+realRad) && (location.y > 254-realRad && location.y < 619+realRad)) {
      velocity.x = 39; 
      velocity.y = velocity.y*-1;
    }
    // Apartment complex 
    if ((location.x > 1274-realRad && location.x < 1600+realRad) && (location.y > 0-realRad && location.y < 619+realRad)) {
      velocity.x = -39; 
      velocity.y = velocity.y*-1;
    }
  }
}
