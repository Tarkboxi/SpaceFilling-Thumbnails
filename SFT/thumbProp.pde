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
int currentIconNumber = 0;

void sizeOfIconsCalculator()
{
  if (firstIcon)
  {
  System.out.println("first one");
  screenCenterX = displayWidth / 2;
  screenCenterY = displayHeight / 2;
  calculatedwindowSizeX = displayWidth- (displayWidth/5);
  calculatedwindowSizeY = displayHeight - (displayHeight/5);
  float totalArea = ( calculatedwindowSizeX ) * (calculatedwindowSizeY ) ;
  widthOfIcon = Math.sqrt(totalArea / (aspectRatio * nOfIcons));
  heightOfIcon = widthOfIcon * aspectRatio ;
  if (heightOfIcon > calculatedwindowSizeY)
  {
    heightOfIcon = calculatedwindowSizeY - 250;
    widthOfIcon = heightOfIcon / aspectRatio;
  }
  
  numberOfColumns = (int) ( calculatedwindowSizeX / widthOfIcon);
  numberOfPotentialCells = numberOfColumns;  
 
  while ( ( numberOfColumns * numberOfRows) < nOfIcons )
  {
    System.out.println("need to add more rows");
    numberOfRows = numberOfRows+1;
    numberOfPotentialCells = numberOfPotentialCells + numberOfPotentialCells;
    while ( (heightOfIcon * numberOfRows) >  calculatedwindowSizeY )
    {
         System.out.println("reducing size of icon");
         widthOfIcon = widthOfIcon * 0.8 ;
         heightOfIcon = widthOfIcon * aspectRatio;
    }
  }
   insertPositionY = (int) ( (screenCenterY) - (heightOfIcon/2) );
   insertPositionX = (int) ( (screenCenterX) - (widthOfIcon/2));
   System.out.println(insertPositionX+","+insertPositionY);
   //   
   int j = 0;
   int k = 0;
   System.out.println("number of cells:"+numberOfPotentialCells);
   for (int i = 0 ; i< nOfIcons; i++)
   {
     System.out.println("col : "+j+" row :"+k);
     listOfXPositions.add((int) ( displayWidth/(5*numberOfColumns) + (j*widthOfIcon) ) );
     listOfYPositions.add((int) ( displayHeight/(5*numberOfRows) + (k*heightOfIcon) ) ); 

     if ( j < numberOfColumns-1 )
     {
       j++;
     }
     else
     { 
       System.out.println("k changed");
       j = 0;
       k++;
     }
   }
   //
   firstIcon = false;
  }
   if ( currentcellNumber < nOfIcons)
   {
      insertPositionX = listOfXPositions.get(currentIconNumber);
      insertPositionY = listOfYPositions.get(currentIconNumber);
       
       if ( columnUnderPlacement < numberOfColumns )
       {
        columnUnderPlacement = columnUnderPlacement+1;
       }
       else
       {
        columnUnderPlacement = 0;
        rowUnderPlacement = rowUnderPlacement+1;
       }  
   }
   
     
}


void thumbNailPropSetter()
{
  // tint(0,200,255);
}




     