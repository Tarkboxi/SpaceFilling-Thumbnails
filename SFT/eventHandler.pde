boolean mouseInside = false;
  
  
  
  
 void controlEvent(ControlEvent theEvent) {
  
   if(theEvent.getId() == 3 || theEvent.getId() == 4 || theEvent.getId() == 1 || theEvent.getId() == 2)
   {
     initScreenButtons.setAutoDraw(false);
     if(theEvent.getId() == 2 || theEvent.getId() == 1)
     {
       d1.close();
       drawAgain = true;
       nOfIcons = 0;
       windowInitializer();
       sizeOfIconsCalculator();
     }
      else if (theEvent.getId() == 3 || theEvent.getId() == 4)
     {
   //    println("getting noficons from dropper");
       drawAgain = true;
       nOfIcons = (int) d1.getValue();
       windowInitializer();
       sizeOfIconsCalculator();
     }
     else if (theEvent.getId() == 3 || theEvent.getId() == 4)
     {
    //   println("getting noficons from dropper");
       drawAgain = true;
       nOfIcons = (int) d1.getValue();
       windowInitializer();
       sizeOfIconsCalculator();
     }
   }
   
   if (theEvent.getId() == -1)
   {
   //  print("default event");
     nOfIcons = 0;
     windowInitializer();
     sizeOfIconsCalculator();
   }
   
    if (theEvent.getId() == 8)
     {
    //   println("entered!!");
       drawAgain = true;
       int modeNumber = (int) d2.getValue();
       if (modeNumber == 0)
       {
    //     println("spatial is false");
         spatialOn = false;
       }
       else
       {
   //      println("spatial is true");
         spatialOn = true;
       }
       //windowInitializer();
       //sizeOfIconsCalculator();
     }
     
    if (theEvent.getId() == 5)
   {
     drawAgain = true;
 //    print("main menu is called");
     nOfIcons = 0;
     windowInitializer();
     sizeOfIconsCalculator();
     initScreenButtons.setAutoDraw(true);
     cp5.setAutoDraw(false);
     backToMainButton.setAutoDraw(false);
     systemStarted = false;
     experimentMode = false;
     experimentResetButton.setAutoDraw(false);
     stopExperiment();
   }
   
     if (theEvent.getId() == 6)
   {
      runExperiment1();
      experimentMode = true;
   }
      if (theEvent.getId() == 7)
   {
      runExperiment2();
      experimentMode = true;
   }
   
}


 void checkForHit() 
 {
  fillThumb = false;
  for (int i=0 ; i<nOfIcons; i++)
  {
    float xStart = listOfXPositions.get(i);
    float yStart = listOfYPositions.get(i);

    float currentWidth = listOfWidths.get(i);
    float currentHeight = listOfHeights.get(i);
    
    if (mouseX > xStart && mouseX < ( xStart+currentWidth))
    {
      if (mouseY > yStart && mouseY < ( yStart+currentHeight) )
      {
        currentHoveredIcon = i;
        fillThumb = true;
      }
    }
  }
 }
 
 boolean checkClickHit()
 {
   for (int i=0 ; i<nOfIcons; i++)
  {
    float xStart = listOfXPositions.get(i);
    float yStart = listOfYPositions.get(i);

    float currentWidth = listOfWidths.get(i);
    float currentHeight = listOfHeights.get(i);
    
    if (mouseX > xStart && mouseX < ( xStart+currentWidth))
    {
      if (mouseY > yStart && mouseY < ( yStart+currentHeight) )
      {
        currentClickedIcon = i;
        return true;
      }
    }
  }
  return false;
 }

 