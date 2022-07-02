
/*  == [Projectile Motion Simulator] == 
 Description: A video game where users are to launch a projectile and hit a golden spot. 
 If they are able to hit it they gain points, the more points they get the better. 
 This program is the setup and main skeletal structure, with individual sub-programs. 
 Author: Anindit Dewan 
 Date: June, 20th, 2022 
 */

// Boolean template for all games.  
boolean startMovement = false; 
boolean restart = false; 
boolean touchSpot = false;  
boolean ballRelease = true; 
boolean typeVelocity = false; 
boolean typeAngle = false; 

// Variables for enabling velocity and angle typing is set up. 
double angle = 45; 
int velocityCounter = 0; 
int angleCounter = 0; 

// All Images declared
PImage Cloud; 
PImage Cliff; 
PImage Grass; 
PImage Sand;
PImage Snow; 
PImage Obstacle1; 
PImage Statue; 
PImage Pillar; 
PImage StatuePillar; 
PImage DesertWall; 
PImage DesertWall2; 
PImage Platform; 
PImage Apartment; 
PImage ScoreBoardHard; 
PImage Credit; 
PImage StartMenu; 
PImage helpMenu;
PImage helpMenu2; 
// First Game objects declared 
Ball mainBall; 
RectangleObstacle firstObstacle; 
RectangleObstacle startingObstacle; 
RectangleObstacle floor; 
RectangleObstacle hitBoxObstacle; 
goldenSpot goldenSpot; 


void setup() {
  size(1600, 700);

  // Load all images. 
  Cliff = loadImage("Cliff.png");
  Grass = loadImage("Grass.png"); 
  Sand = loadImage("Sand.png"); 
  Obstacle1 = loadImage("Wall.png"); 
  StartMenu = loadImage("GameMenu.png"); 
  levelMenu = loadImage("LevelScreen.png"); 
  helpMenu = loadImage("HelpMenu.png"); 
  Pillar = loadImage("Pillars.png"); 
  StatuePillar = loadImage("StatuePillar.png"); 
  Statue = loadImage("Statue.png"); 
  Snow = loadImage("Snow.png"); 
  DesertWall = loadImage("DesertWall.png"); 
  DesertWall2 = loadImage("DesertWall2.png"); 
  Platform = loadImage("PlatformHard.png"); 
  Apartment = loadImage("ApartmentComplex.png"); 
  Cloud = loadImage("Cloud.png"); 
  ScoreBoardHard = loadImage("ScoreBoardHard.png"); 
  helpMenu2 = loadImage("HelpMenu2.png"); 
  Credit = loadImage("Credits.png"); 

  // Level 1 Initialization of Objects 
  mainBall = new Ball(color(250, 250, 250), 350, 235, 39, -42); 
  startingObstacle = new RectangleObstacle(color(250, 250, 250), 0, 300, 100, 1000); 
  firstObstacle = new RectangleObstacle(color(250, 0, 0), 900, 200, 100, 420); 
  goldenSpot = new goldenSpot(randomGoldenSpot, 620, 100, 10); 
  mediumBall = new MediumBall();
  hardBall = new HardBall();

  // Level 2 Initialization of Objects  
  mediumRectangleObstacle1 = new RectangleObstacle(color(250, 250, 250), 1525, 133, 75, 487); 
  mediumRectangleObstacle2 = new RectangleObstacle(color(250, 250, 250), 1175, 247, 94, 373); 
  mediumRectangleObstacle3 = new RectangleObstacle(color(250, 250, 250), 435, 540, 365, 79); 
  mediumRectangleObstacle4 = new RectangleObstacle(color(250, 250, 250), 435, 256, 365, 79); 
  mediumRectangleObstacle5 = new RectangleObstacle(color(250, 250, 250), 474, 335, 13, 205); 
  mediumRectangleObstacle6 = new RectangleObstacle(color(250, 250, 250), 751, 335, 13, 205); 
  slab1 = new RectangleObstacle(color(250, 250, 250), 1270, 522, 87, 21); 
  goldenSpotMedium = new goldenSpot(randomGoldenSpotMediumX, randomGoldenSpotMediumY, 87, 10); 

  // Level 3 Initialization of Objects 
  platform = new RectangleObstacle(color(250, 250, 250), 0, 255, 100, 366); 
  apartmentComplex = new RectangleObstacle(color(250, 250, 250), 1275, 0, 325, 619); 
  statueHolder = new RectangleObstacle(color(250, 250, 250), 590, 442, 160, 177);
  statue = new RectangleObstacle(color(250), 599, 162, 141, 281); 
  goldenSpotHard = new goldenSpot(randomGoldenSpotHardX, randomGoldenSpotHardY, 87, 10);
}

// Credit Method (only method here because it is so small, not much is needed) 
boolean creditBoolean = false; 
void Credits() {
  image(Credit, 0, 0);
}


// Draw loop, which will display all of the menus and game/levels. Each menu and level is a method which does a particular subtask. 
void draw() {
  //System.out.println(mouseX + " " + mouseY); 
  background(0, 191, 255); 
  frameRate(75);
  if (mainStart == true) {
    startMenu();
  }
  if (creditBoolean == true) {
    Credits();
  }
  if (rulesStart == true) {
    ruleMenu();
  }
  if (levelStart == true) {
    levelMenu();
  }
  if (readFileBoolean == true) {
    printFile();
  }
  if (gameStart == true) {
    game();
  }
  if (gameTwoStart == true) {
    gameTwo();
  }
  if (gameThreeStart == true) {
    gameThree();
  }
}

void mousePressed() {
  // Buttons for main menu 
  if (mainStart == true && (mouseX > 90 && mouseX < 295) && (mouseY > 255 && mouseY < 325)) {
    mainStart = false; 
    levelStart = true;
  } 
  if (mainStart == true && (mouseX > 90 && mouseX < 295) && (mouseY > 340 && mouseY < 415)) {
    exit();
  }
  if (mainStart == true && (mouseX > 90 && mouseX < 295) && (mouseY > 430 && mouseY < 494)) {
    mainStart = false; 
    rulesStart = true;
  }

  if (mainStart == true && (mouseX > 90 && mouseX < 295) && (mouseY > 520 && mouseY < 590)) {
    mainStart = false; 
    if (autoBoolean == true) {
      autoFile();
    }
    readFileBoolean = true;
  }
  // Buttons for level menu 
  if (levelStart == true && (mouseX > 0 && mouseX < 523) && (mouseY > 523 && mouseY < 703)) {
    gameStart = true; 
    levelStart = false;
  }
  if (levelStart == true && (mouseX > 523 && mouseX < 1038) && (mouseY > 523 && mouseY < 703)) {
    levelStart = false; 
    gameTwoStart = true;
  }
  if (levelStart == true && (mouseX > 1046 && mouseX < 1600) && (mouseY > 523 && mouseY < 703)) {
    levelStart = false; 
    gameThreeStart = true;
  } 
  // Click will give permission for the ball to move. 
  if ((gameStart == true || gameTwoStart == true || gameThreeStart == true) && ballRelease == true) {
    mainBall.booleanMove();
    mediumBall.booleanVectorMove();
  }
  if (gameStart == true && ballRelease == true) {
    ;
  }
}

void keyPressed() {
  // Credit menu 
  if (mainStart == true && (key == 'v' || key == 'V')) {
    mainStart = false; 
    creditBoolean = true;
  }
  if (levelStart == true && (key == '1' || key == '1')) { 
    levelStart = false; 
    gameStart = true;
  }
  if (levelStart == true && (key == '2' || key == '2')) {
    levelStart = false; 
    gameTwoStart = true;
  }
  if (levelStart == true && (key == '3' || key == '3')) {
    levelStart = false; 
    gameThreeStart = true;
  }
  if (levelStart == true && key == ',') {
    levelStart = false; 
    mainStart = true;
  }
  if (rulesStart == true && key == ',') {
    rulesStart = false; 
    mainStart = true;
  }
  if (readFileBoolean == true && key == ',') {
    readFileBoolean = false; 
    mainStart = true;
  }
  if (creditBoolean == true && key == ',') {
    creditBoolean = false; 
    mainStart = true;
  }
  if ((gameStart == true || gameTwoStart == true || gameThreeStart == true) && key == ',') {
    gameStart = false; 
    gameTwoStart = false; 
    gameThreeStart = false; 
    levelStart = true;
  }
  if (gameStart == true || gameTwoStart == true || gameThreeStart == true) {
    if (key == 'C' || key == 'c') {
      velocityCounter = velocityCounter + 1; 
      if (velocityCounter == 1) {
        typeVelocity = true;
      }
      if (velocityCounter == 2) {
        typeVelocity = false; 
        velocityCounter = 0;
      }
    }
    if (key == 'B' || key == 'b') {
      angleCounter = angleCounter + 1; 
      if (angleCounter == 1) {
        typeAngle = true;
      }
      if (angleCounter == 2) {
        typeAngle = false; 
        angleCounter = 0;
      }
    }
    if (key == 'R' || key == 'r') {
      mainBall.restart();  
      mediumBall.vectorRestart();
      hardBall.hardBallRestart();
    }
    // Checks if the key is a digit and the user is allowed to type angle/velocity then it will create a string which will be parsed later for use (setting the speed) 
    if (Character.isDigit(key) && typeVelocity == true) {
      if (value.length() < 3) {
        value = value += key;
      }
    }
    if (Character.isDigit(key) && typeAngle == true) {
      if (angleValue.length() < 2) {
        angleValue = angleValue + key;
      }
    }
    if (key == 't' || key == 'T') {
      value = "";
    }
    if (key == 'n' || key == 'N') {
      angleValue = "";
    }

    if (key == 'G' || key == 'g') {
      if (gameStart == true) {
        mainBall.setSpeed();
      } else if (gameTwoStart == true) {
        mediumBall.setVectorSpeed();
      } else if (gameThreeStart == true) {
        hardBall.hardSetVectorSpeed();
      }
    }

    if (key == 'S' || key == 's') {
      physicsStats(); 
      physicsStatsMedium();
      physicsStatsHard(); 
      savesFile();
      readFile();
    } 
    if (key == 'U' || key == 'u') {
      mediumBall.autoWin();
    }
  }
}
