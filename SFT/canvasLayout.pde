boolean spatialOn = false;
int iconWidth = 0;
double widthOfIcon;
double heightOfIcon = widthOfIcon * aspectRatio ;
int screenCenterX = displayWidth / 2;
int screenCenterY = displayHeight / 2;
int iconCenterX = 0;
int iconCenterY = 0;
boolean firstIcon = true;
boolean secondIcon = false;
int windowRemainingSizeY = displayHeight;
int windowRemainingSizeX = displayWidth;
int calculatedwindowSizeX = displayWidth- (displayWidth/5);
int calculatedwindowSizeY = displayHeight - (displayHeight/5);
int insertPositionX = 25;
int insertPositionY = 50;
int numberOfRows = 1;
int numberOfColumns = 1;
int numberOfIconsLeft = nOfIcons;
int rowUnderPlacement = 0;
int columnUnderPlacement = 0;
int currentcellNumber = 1;
int numberOfPotentialCells = 0;
ArrayList<Integer> listOfXPositions = new ArrayList<Integer>();
ArrayList<Integer> listOfYPositions = new ArrayList<Integer>();
ArrayList<Float> listOfWidths = new ArrayList<Float>();
ArrayList<Float> listOfHeights = new ArrayList<Float>();
int trackedRow = 0;
int trackedColumn = 0;



int displayLeftBorder = 0;
int displayRightBorder = 0;

int displayTopBorder = 0;
int displayBottomBorder = 0;

void windowInitializer()
{
  screenCenterX = displayWidth / 2;
  screenCenterY = displayHeight / 2;
  //calculatedwindowSizeX = (int) ( displayWidth- (displayWidth/20) );
  calculatedwindowSizeY = (int) ( displayHeight - (displayHeight/20) );
  calculatedwindowSizeX = (int) ( displayWidth - (displayWidth*0.02) );

  displayLeftBorder = displayWidth - calculatedwindowSizeX;
  displayRightBorder = calculatedwindowSizeX;
                                  
  displayTopBorder = displayHeight - calculatedwindowSizeY;
  displayBottomBorder = calculatedwindowSizeY;
 
  float totalArea = ( displayRightBorder - displayLeftBorder ) * (displayBottomBorder - displayTopBorder ) ;
  widthOfIcon = Math.sqrt(totalArea / (aspectRatio * nOfIcons)); // maximum width that an icon can have
  heightOfIcon = widthOfIcon * aspectRatio ; // max height each icon can have
   while (heightOfIcon > (displayBottomBorder - displayTopBorder) )
  {
    heightOfIcon = heightOfIcon - (heightOfIcon/10);
    widthOfIcon = heightOfIcon / aspectRatio;
  }
  
  numberOfColumns = (int) ( (displayRightBorder - displayLeftBorder) / widthOfIcon); // rough initial number of columns
  numberOfRows = (int) ( (displayBottomBorder - displayTopBorder) / heightOfIcon); // rough initial number of rows
  
  numberOfPotentialCells = numberOfColumns * numberOfRows;   
}

void sizeOfIconsCalculator()
{
 listOfWidths = new ArrayList<Float>();
 listOfHeights = new ArrayList<Float>();
 listOfXPositions = new ArrayList<Integer>();
 listOfYPositions = new ArrayList<Integer>();
  while ( ( numberOfColumns * numberOfRows) < nOfIcons )
  {
    // let's add more columns if possible
    numberOfColumns = numberOfColumns + 1;
    while ( (numberOfColumns * widthOfIcon) > (displayRightBorder - displayLeftBorder) )
    {
      widthOfIcon = widthOfIcon * 0.95 ;
      heightOfIcon = widthOfIcon * aspectRatio;
      System.out.println( (numberOfColumns * widthOfIcon)+"   ,   "+(displayRightBorder - displayLeftBorder));
    }
  }
  System.out.println (numberOfColumns+" X "+numberOfRows);
  numberOfPotentialCells = numberOfColumns * numberOfRows;  
  insertPositionY = (int) ( displayTopBorder+ ( (displayBottomBorder - displayTopBorder)/2 ) - (heightOfIcon/2) );
  insertPositionX = (int) ( displayLeftBorder+( (displayRightBorder - displayLeftBorder)/2 ) - (widthOfIcon/2)  );

  int j = 0;
  int k = 0;
  int horizontalClusterOffset = 0;
  int verticalClusterOffset = 0;
  int horizontalOffset = 0;
  int verticalOffset = 0;
  for (int i = 0 ; i< numberOfPotentialCells; i++)
  {
    if ( j < numberOfColumns) // for each column
    {
      if (j == (numberOfColumns)/2 && (spatialOn) )
      {
          horizontalClusterOffset = horizontalClusterOffset+50;
      }
      listOfXPositions.add( (int) ( displayLeftBorder + ( widthOfIcon * j) ) +horizontalOffset+horizontalClusterOffset );
    
      listOfWidths.add((float)widthOfIcon);
      listOfHeights.add((float)heightOfIcon);
      j = j+1;
      if (spatialOn)
      {
        horizontalOffset = horizontalOffset+4;
      }
      else
      {
        horizontalOffset = horizontalOffset+2;
      }
    }
    if( k < numberOfRows)
    {
      listOfYPositions.add( (int) ( displayTopBorder + ( heightOfIcon * k) +verticalOffset+verticalClusterOffset ) );
    }
    if ( j == numberOfColumns)
    {
      j = 0;
      horizontalClusterOffset = 0;
      horizontalOffset = 0;
      k = k+1;
      if(spatialOn)
      {
        verticalOffset = verticalOffset+6;
        if (k == numberOfRows/2)
        {
          verticalClusterOffset = verticalClusterOffset+50;
        }
      }
      else
      {
        verticalOffset = verticalOffset+2;
      }
    }
  }
}









     