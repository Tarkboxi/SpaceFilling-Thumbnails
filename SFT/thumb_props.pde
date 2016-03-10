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