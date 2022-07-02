
/*  == [Physics Stats Array] == 
 Description: Physics stats array is the program which will use the compiled data from the arrays in level 1, 2 and 3 and then compute other statistics (i.e. time and vertial displacement). 
 Author: Anindit Dewan 
 Date: June, 20th, 2022 
 */

import java.text.DecimalFormat; 
DecimalFormat significantFigure = new DecimalFormat("#.#"); 
// Arrays for level 1 
double [] velocityArray = new double[1000]; 
double [] velocityYArray = new double[1000]; 
double [] angleArray = new double[1000]; 
double [] finalVelocityArray = new double[1000]; 
double [] distanceArray = new double[1000]; 
double [] timeArray = new double[1000]; 
int arrayIndex = 0; 

// Arrays for level 2 
double [] velocityArrayMedium = new double[1000]; 
double [] velocityYArrayMedium = new double[1000]; 
double [] angleArrayMedium = new double[1000]; 
double [] finalVelocityArrayMedium = new double[1000]; 
double [] distanceArrayMedium = new double[1000]; 
double [] timeArrayMedium = new double[1000]; 
int arrayIndexMedium = 0; 

// Arrays for level 3 
double [] velocityArrayHard = new double[1000]; 
double [] velocityYArrayHard = new double[1000]; 
double [] angleArrayHard = new double[1000]; 
double [] finalVelocityArrayHard = new double[1000]; 
double [] distanceArrayHard = new double[1000]; 
double [] timeArrayHard = new double[1000]; 
int arrayIndexHard = 0; 

// For all methods they will collect the data from the backend and then calculate other values such as time and distance(y) 
void physicsStats() {
  println("==[EASY MODE STATS]=="); 
  for (int i = 0; i <= arrayIndex+1; i++) {
    System.out.print(velocityArray[i] + " ");
  }
  System.out.println(); 
  for (int i = 0; i <= arrayIndex+1; i++) {
    System.out.print(velocityYArray[i] + " ");
  }
  System.out.println(); 
  for (int i = 0; i<= arrayIndex+1; i++) {
    System.out.print(finalVelocityArray[i] + " ");
  }
  System.out.println(); 
  for (int i = 0; i<= arrayIndex+1; i++) {
    timeArray[i] = ((velocityArray[i]-velocityYArray[i])/(9.8));
  }
  System.out.println(); 
  for (int i = 0; i <= arrayIndex+1; i++) {
    System.out.print(timeArray[i] + " ");
  }
  println(); 
  for (int i = 0; i <= arrayIndex+1; i++) {
    System.out.print(String.valueOf(timeArray[i]) + " ");
  }

  System.out.println(); 
  for (int i = 0; i <= arrayIndex+1; i++) {
    distanceArray[i] = ((velocityArray[i]*timeArray[i])-(0.5*9.8*(Math.pow(timeArray[i], 2))));
  }
}

void physicsStatsMedium() {
  println("==[MEDIUM MODE STATS]=="); 
  for (int i = 0; i <= arrayIndexMedium+1; i++) {
    System.out.print(velocityArrayMedium[i] + " ");
  }
  println(); 
  for (int i = 0; i <= arrayIndexMedium+1; i++) {
    System.out.print(finalVelocityArrayMedium[i] + " ");
  }
  for (int i = 0; i <= arrayIndexMedium+1; i++) {
    timeArrayMedium[i] = ((velocityArrayMedium[i] - velocityYArrayMedium[i])/(9.8));
  }
  for (int i = 0; i <= arrayIndexMedium+1; i++) {
    distanceArrayMedium[i] = ((velocityArrayMedium[i]*timeArrayMedium[i])-(0.5*9.8*(Math.pow(timeArrayMedium[i], 2))));
  }
}

void physicsStatsHard() {
  println("==[HARD MODE STATS]=="); 
  for (int i = 0; i <= arrayIndexHard+1; i++) {
    System.out.print(significantFigure.format(velocityArrayHard[i]) + " ");
  }
  println(); 
  for (int i = 0; i <= arrayIndexHard+1; i++) {
    System.out.print(significantFigure.format(finalVelocityArrayHard[i]) + " ");
  }
  println(); 
  for (int i = 0; i <= arrayIndexHard+1; i++) {
    System.out.print(finalVelocityArrayHard[i] + " ");
  }
  for (int i = 0; i <= arrayIndexHard+1; i++) {
    timeArrayHard[i] = ((velocityArrayHard[i] - velocityYArrayHard[i])/(9.8));
  }
  for (int i = 0; i <= arrayIndexHard+1; i++) {
    distanceArrayHard[i] = ((velocityArrayHard[i]*timeArrayHard[i])-(0.5*9.8*(Math.pow(timeArrayHard[i], 2))));
  }
}
