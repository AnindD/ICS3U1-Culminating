
/*  == [FileIO] == 
 Description: Send the contents of the physics statistics array into a file. 
 Author: Anindit Dewan 
 Date: June, 20th, 2022 
 */


import java.io.*;
FileWriter file;    
BufferedWriter buffer;   

// Writes all items from the arrays into the file "physicsStats.txt". 
void savesFile() {
  System.out.println("SAVED"); 
  try  
  {
    file = new FileWriter ("physicsStats.txt");   
    buffer = new BufferedWriter (file);
    buffer.write("==[EASY STATISTICS]=="); 
    buffer.newLine(); 
    buffer.write("Initial Velocity (m/s): "); 
    for (int i = 0; i <= arrayIndex-1; i++) {
      buffer.write(String.valueOf(velocityArray[i]) + ", ");
    }
    buffer.newLine(); 
    buffer.write("Final Velocity (m/s): "); 
    for (int i = 0; i <= arrayIndex-1; i++) {
      buffer.write(String.valueOf(significantFigure.format(finalVelocityArray[i])) + ", ");
    }
    buffer.newLine(); 
    buffer.write("Time (s): "); 
    for (int i = 0; i <= arrayIndex-1; i++) {
      buffer.write(String.valueOf(significantFigure.format(timeArray[i])) + ", ");
    }
    buffer.newLine(); 
    buffer.write("Distance (m): "); 
    for (int i = 0; i<= arrayIndex-1; i++) {
      buffer.write(String.valueOf(significantFigure.format(distanceArray[i])) + ", ");
    }
    buffer.newLine(); 
    buffer.write("==[MEDIUM STATISTICS]==");
    buffer.newLine(); 
    buffer.write("Initial Velocity (m/s): "); 
    for (int i = 0; i <= arrayIndexMedium-1; i++) {
      buffer.write(String.valueOf(velocityArrayMedium[i]) + ", ");
    }
    buffer.newLine(); 
    buffer.write("Final Velocity (m/s): "); 
    for (int i = 0; i <= arrayIndexMedium-1; i++) {
      buffer.write(String.valueOf(significantFigure.format(finalVelocityArrayMedium[i])) + ", ");
    }
    buffer.newLine(); 
    buffer.write("Time (s): "); 
    for (int i = 0; i <= arrayIndexMedium-1; i++) {
      buffer.write(String.valueOf(significantFigure.format(timeArrayMedium[i])) + ", ");
    }
    buffer.newLine(); 
    buffer.write("Distance (m): "); 
    for (int i = 0; i<= arrayIndexMedium-1; i++) {
      buffer.write(String.valueOf(significantFigure.format(distanceArrayMedium[i])) + ", ");
    }
    buffer.newLine(); 
    buffer.write("==[HARD STATISTICS]==");
    buffer.newLine(); 
    buffer.write("Initial Velocity (m/s): "); 
    for (int i = 0; i <= arrayIndexHard-1; i++) {
      buffer.write(String.valueOf(velocityArrayHard[i]) + ", ");
    }
    buffer.newLine(); 
    buffer.write("Final Velocity (m/s): "); 
    for (int i = 0; i <= arrayIndexHard-1; i++) {
      buffer.write(String.valueOf(significantFigure.format(finalVelocityArrayHard[i])) + ", ");
    }
    buffer.newLine(); 
    buffer.write("Time (s): "); 
    for (int i = 0; i <= arrayIndexHard-1; i++) {
      buffer.write(String.valueOf(significantFigure.format(timeArrayHard[i])) + ", ");
    }
    buffer.newLine(); 
    buffer.write("Distance (m): "); 
    for (int i = 0; i<= arrayIndexHard-1; i++) {
      buffer.write(String.valueOf(significantFigure.format(distanceArrayHard[i])) + ", ");
    }
    buffer.newLine(); 
    buffer.write("Normal Mode Score: " + String.valueOf(counter)); 
    buffer.newLine(); 
    buffer.write("Desert Mode Score: " + String.valueOf(score2)); 
    buffer.newLine(); 
    buffer.write("Soviet Mode Score: " + String.valueOf(score3)); 
    buffer.close ();
  }
  // catch the error and print an error message
  catch (IOException err)
  {
    System.out.println ("error");
  }
}
