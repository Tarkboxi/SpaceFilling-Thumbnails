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
  if ( ( oldHeight ) < ( (displayBottomBorder - displayTopBorder ) * 0.40 ) )
  {
    
      filledHeight = (displayBottomBorder - displayTopBorder ) * 0.40;
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


void drawTrackedRowsAndColumns()
{
      trackedRow = ( ( currentHoveredIcon+1 ) / (numberOfColumns) ) + 1;
      if ( ( currentHoveredIcon+1 ) % (numberOfColumns) == 0 )
      {
        trackedRow = trackedRow-1;
      }
      trackedColumn = (currentHoveredIcon+1) - ( (trackedRow-1) * (numberOfColumns) );
      for (int i=trackedColumn, j=1; i<nOfIcons ; i =(i +(j*numberOfColumns)) )
      {
               if(i-1 != currentHoveredIcon)
               {
                 tint(220, 220, 255);
                 image(pdfImageList.get(i-1),listOfXPositions.get(i-1),listOfYPositions.get(i-1),listOfWidths.get(i-1), listOfHeights.get(i-1));
               }
               
      }
      for (int i = ( (trackedRow-1) *numberOfColumns)+1 ; ( i <= (trackedRow * ( numberOfColumns) ) ) && i <= nOfIcons ; i++)
      {
        if(i-1 != currentHoveredIcon)
        {
          try
          {
            image(pdfImageList.get(i-1),listOfXPositions.get(i-1),listOfYPositions.get(i-1),listOfWidths.get(i-1), listOfHeights.get(i-1));
          }
          catch(IndexOutOfBoundsException e)
          {
            image(pdfImageList.get(i),listOfXPositions.get(i),listOfYPositions.get(i),listOfWidths.get(i), listOfHeights.get(i));
          }
         }
      }
      noTint();
}