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
int errorCount = 0;

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
  experimentResetButton.addButton("Start / Restart Experiment 1").setPosition( (displayWidth/2 - 100),10).setSize(200,30).setValue(0).activateBy(ControlP5.RELEASE).setId(6);;
  experimentResetButton.addButton("Start / Restart Experiment 2").setPosition( (displayWidth/2 + 150),10).setSize(200,30).setValue(0).activateBy(ControlP5.RELEASE).setId(7);;
  d2 = experimentResetButton.addDropdownList("conditionSequence").setPosition(displayWidth/2 + 400, 10).setId(8);  
  customize2(d2);


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
      text("Locate", 10, (int) ( ( (displayHeight/2)-(experimentPreviewPageHeight/2) ) - 20) ); 
    }
    else
    {
      if (zoomedMode && correctText && experimentRunning)
      {
        
        fill(0,255,0);
        rect(0,  ( (float) ( (displayHeight/2)-(experimentPreviewPageHeight/2) ) )- 100, (float) experimentPreviewPageWidth , 80);
      } 
      else if(zoomedMode && experimentRunning)
      {
          fill(255,0,0);
          rect(0,  ( (float) ( (displayHeight/2)-(experimentPreviewPageHeight/2) ) )- 100, (float) experimentPreviewPageWidth , 80);
      }

    }
    if(startedRunningExpe)
    {
      image(pdfImageList.get(currentPageToLocate),5,(float) ( (displayHeight/2)-(experimentPreviewPageHeight/2)),(float) experimentPreviewPageWidth, (float)experimentPreviewPageHeight);
      if (startTimer && !zoomedMode && startedRunningExpe)
      {
//        println("started timer");
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
         // println("to print"+currentHoveredIcon);
          if(startedRunningExpe)
          {
          if (currentHoveredIcon == currentPageToLocate)
          {
            endTime = millis();
            elapsedTime = endTime - startTime;
            println(experimentSet+","+spatialOn+","+experimentPage+","+currentPageToLocate+","+elapsedTime+","+errorCount);
            startTime =  0;
            endTime = 0;
            elapsedTime = 0;
            errorCount = 0;
            continueExpe();
            correctText = true;
          }
          else
          {
            errorCount = errorCount+1;
            correctText = false;
          }
         }
          image(pdfImageList.get(currentClickedIcon),(displayWidth / 2) - (calculatedwindowSizeY*0.8 / (aspectRatio*2) ),(displayHeight / 2) - (calculatedwindowSizeY*0.8/2) ,(calculatedwindowSizeY*0.9 / aspectRatio) , calculatedwindowSizeY*0.9);
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



  
 