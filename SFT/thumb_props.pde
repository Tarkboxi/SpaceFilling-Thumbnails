void thumbNailPropSetter()
{
  // tint(0,200,255);
}

float[] sizeRetriever(int currentIconNumber)
{
    float[] dimensionList = new float[2]; 
    dimensionList[0] = (float) (listOfWidths.get(currentIconNumber));
    dimensionList[1] = (float) (listOfHeights.get(currentIconNumber));  
    return dimensionList;
}

int[] drawPositionSetter(int currentIconNumber)
{
  int[] coordList = new int[2]; 
  insertPositionX = listOfXPositions.get(currentIconNumber) ;
  insertPositionY = listOfYPositions.get(currentIconNumber) ;   
  coordList[0] = insertPositionX;
  coordList[1] = insertPositionY;
  return coordList;
}


void SpaceFiller()
{
  float oldHeight = listOfHeights.get(currentHoveredIcon) ;
  float filledHeight = 0;
  float filledWidth = 0;
  if ( ( oldHeight ) < ( (displayBottomBorder - displayTopBorder ) * 0.45 ) )
  {
    
      filledHeight = (displayBottomBorder - displayTopBorder ) * 0.45;
      filledWidth = filledHeight / aspectRatio;
      filledThumbNail[0] = filledWidth;
      filledThumbNail[1] = filledHeight;
      if( (displayBottomBorder - mouseY) < filledHeight )
      {
              filledThumbNail[3] = mouseY - filledHeight;
      }
      else
      {
              filledThumbNail[3] = mouseY;
      }
      if(displayRightBorder - mouseX < filledWidth)
      {
              filledThumbNail[2] = mouseX - filledWidth;
      }
      else
      {
              filledThumbNail[2] = mouseX;
      }
      filledThumbNail[4] = currentHoveredIcon;
   
  }
  else
  {
    fillThumb = false;
  }
   
}