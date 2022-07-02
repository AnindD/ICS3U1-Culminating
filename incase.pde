import java.io.*;
boolean readFileBoolean = false; 
int textX = 100; 
int textY = 100; 
int readFileCounter = 0; 
boolean autoBoolean = true; 

String[] text = new String[100];

void autoFile() {
  background(0, 0, 0); 
  String fileName = "physicsStats.txt"; 
  String line;
  BufferedReader buffer; 

  try { 

    buffer = new BufferedReader(new FileReader(fileName)); 

    while ((line = buffer.readLine()) != null )       
    { 
      readFileCounter++; 
      text[readFileCounter] = line;
    } 
    buffer.close();
  } 
  catch ( IOException iox ) { 
    System.out.println("Problem reading " + fileName);
  }
}


void readFile() {
  autoBoolean = false; 
  String fileName = "physicsStats.txt"; 
  String line;
  BufferedReader buffer;
  readFileCounter = 0; 

  try { 

    buffer = new BufferedReader(new FileReader(fileName)); 

    while ((line = buffer.readLine()) != null )       
    { 
      readFileCounter++; 
      text[readFileCounter] = line;
    } 
    buffer.close();
  } 
  catch ( IOException iox ) { 
    System.out.println("Problem reading " + fileName);
  }
}

void printFile() {
  background(0, 0, 0); 
  PFont statisticsFont = loadFont("Acre-Medium-16.vlw"); 
  textFont(statisticsFont); 
  fill(250, 250, 250); 
  text(text[1], 100, 110); 
  text(text[2], 100, 130); 
  text(text[3], 100, 150); 
  text(text[4], 100, 170); 
  text(text[5], 100, 190); 
  text(text[6], 100, 230); 
  text(text[7], 100, 250); 
  text(text[8], 100, 270); 
  text(text[9], 100, 290); 
  text(text[10], 100, 310); 
  text(text[11], 100, 350); 
  text(text[12], 100, 370); 
  text(text[13], 100, 390); 
  text(text[14], 100, 410); 
  text(text[15], 100, 430); 
  text(text[16], 100, 490);
  text(text[17], 100, 510); 
  text(text[18], 100, 530);
}
