ArrayList<PImage> pdfImageList = new ArrayList<PImage>();  // Declare a variable of type PImage
int nOfIcons = 1;
float aspectRatio = 1.414;
import controlP5.*;
ControlP5 cp5;
ControlP5 initScreenButtons;
ControlP5 experimentResetButton;
ControlP5 backToMainButton;
DropdownList d1;
DropdownList d2;

int currentHoveredIcon = 0;
boolean fillThumb = false;
float[] filledThumbNail = new float[5];
PImage bgImage;
boolean eraseFill = false;
boolean zoomedMode = false;
int currentClickedIcon = 999;
boolean refreshScreenshot = true;
boolean drawAgain = false;
float previewSliderRatioOfWindow = 0.24;
boolean experimentRunning = false;

boolean correctText = false;

void setup() {
  
  fullScreen();
  // for the drop down
  
  cp5 = new ControlP5(this);
  d1 = cp5.addDropdownList("Pages").setPosition(10, 10).setId(3);    
  customize(d1);
  
  cp5.addButton("switchMode").setPosition(300,10).setSize(80,30).setValue(0).activateBy(ControlP5.RELEASE).setId(4);;
  cp5.setAutoDraw(false);
  
  
  backToMainButton = new ControlP5(this);
  backToMainButton.addButton("MainMenu").setPosition( (displayWidth-200),10).setSize(80,30).setValue(0).activateBy(ControlP5.RELEASE).setId(5);;
  backToMainButton.setAutoDraw(false);
  
  initScreenButtons = new ControlP5(this);
  initScreenButtons.setAutoDraw(false);
  
  experimentResetButton = new ControlP5(this);
  experimentResetButton.addButton("Start / Restart Experiment").setPosition( (displayWidth/2 - 100),10).setSize(200,30).setValue(0).activateBy(ControlP5.RELEASE).setId(6);;
  experimentResetButton.setAutoDraw(false);
  
  runMenuScreen();
  
 

  
  // for the icons
  createImageList();
  windowInitializer();
  sizeOfIconsCalculator();
  
  int currentIconNumber = 0;
  background(0);  
  
  for (int i=0; i<nOfIcons; i++)
  {
    int[] currentDrawLocation = drawPositionSetter(currentIconNumber);
    float[] currentIconDimension = sizeRetriever(currentIconNumber);
    
    image(pdfImageList.get(i),currentDrawLocation[0],currentDrawLocation[1],currentIconDimension[0], currentIconDimension[1]);
    currentIconNumber = currentIconNumber+1;
  }
  
}




void draw() {
  if (systemStarted)
  {
  int currentIconNumber = 0;
  if (systemStarted && drawAgain)
  {
    print("attempt to draw new!!");
    
    background(0);  
    for (int i=0; i<nOfIcons; i++)
    { 
      int[] currentDrawLocation = drawPositionSetter(currentIconNumber);
      float[] currentIconDimension = sizeRetriever(currentIconNumber);
      image(pdfImageList.get(i),currentDrawLocation[0],currentDrawLocation[1],currentIconDimension[0], currentIconDimension[1]);
      currentIconNumber = currentIconNumber+1;
    }
    
    if(refreshScreenshot)
    {
      saveFrame(dataPath("savedFrame.jpg"));
      delay(450);      updateBg();
      println("loaded new bg");
    }
    zoomedMode = false;
    refreshScreenshot = true;
    drawAgain = false;
    if (experimentMode && firstExperimentInit)
    {
      startedRunningExpe = true;
      startTimer = true;
      firstExperimentInit = false;
    }
  }    

  // REGULAR DRAW
  if (!zoomedMode && systemStarted)
  {
  if (fillThumb)
    {
      SpaceFiller();
      if (fillThumb)
       {
        background(0);  
        image(bgImage,0,0,displayWidth, displayHeight);
        if(spatialOn)
        {
          drawTrackedRowsAndColumns();
        }
        image(pdfImageList.get((int)filledThumbNail[4]),filledThumbNail[2],filledThumbNail[3],filledThumbNail[0], filledThumbNail[1]);
        eraseFill = true;
       }
    }
    if (!fillThumb)
    {
      if (eraseFill)
      {
        background(0);  
        image(bgImage,0,0,displayWidth, displayHeight);
      }
    }
  }
  if(experimentMode)
  {
    fill(180,180,180);
    rect(0, 0, (displayWidth*previewSliderRatioOfWindow), displayHeight);
///
    textSize(8);
    textFont(mono);
    fill(40, 40, 40);
    if(!zoomedMode && experimentRunning)
    {
      text("Locate this Page", 10, (int) ( ( (displayHeight/2)-(experimentPreviewPageHeight/2) ) - 20) ); 
    }
    else
    {
      if (zoomedMode && correctText)
      {
        text("Good job, now go back when you're", 10, (int) ( ( (displayHeight/2)-(experimentPreviewPageHeight/2) ) - 40) ); 
                text(" ready for the next trial", 10, (int) ( ( (displayHeight/2)-(experimentPreviewPageHeight/2) ) - 15) ); 
      } 
      else if(zoomedMode)
      {
        text("You clicked the wrong page,", 10, (int) ( ( (displayHeight/2)-(experimentPreviewPageHeight/2) ) - 40) ); 
                text("go back and look again...", 10, (int) ( ( (displayHeight/2)-(experimentPreviewPageHeight/2) ) - 15) ); 

      }

    }
    if(startedRunningExpe)
    {
      image(pdfImageList.get(currentPageToLocate),5,(float) ( (displayHeight/2)-(experimentPreviewPageHeight/2)),(float) experimentPreviewPageWidth, (float)experimentPreviewPageHeight);
      if (startTimer && !zoomedMode)
      {
        println("timer started!! ***********************");
        startTimer = false;
        startTime = millis();
      }
      
    }
  }
  
} 
else
{
  background(0);
}
  
}

void mouseMoved()
{
  checkForHit();
}

void mouseClicked()
{
  
  if (mouseButton == LEFT)
  {
    if (!zoomedMode)
    {
      if (checkClickHit())
      {         
         if (currentClickedIcon != 999)
         {
          background(0);  
          println("to print"+currentHoveredIcon);
          if(startedRunningExpe)
          {
          if (currentHoveredIcon == currentPageToLocate)
          {
            endTime = millis();
            elapsedTime = endTime - startTime;
            println("time elapsed : "+elapsedTime);
            startTime =  0;
            endTime = 0;
            elapsedTime = 0;
            continueExpe();
            correctText = true;
          }
          else
          {
            correctText = false;
          }
         }
          image(pdfImageList.get(currentClickedIcon),(displayWidth / 2) - (calculatedwindowSizeY*0.8 / (aspectRatio*2) ),(displayHeight / 2) - (calculatedwindowSizeY*0.8/2) ,(calculatedwindowSizeY*0.8 / aspectRatio) , calculatedwindowSizeY*0.8);
          zoomedMode = true;
         }
      }
    }
  }
  if (mouseButton == RIGHT)
  {
    refreshScreenshot = false;
    drawAgain = true;
  }
}



  
 