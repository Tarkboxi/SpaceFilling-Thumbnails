boolean waitingforLoad = false;
boolean startedRunningExpe = false;
boolean startTimer = false;

boolean firstExperimentInit = true;

int startTime = 0;
int endTime = 0;
int elapsedTime = 0;
int experimentPage = 0;
double experimentPreviewPageWidth = 0;
double experimentPreviewPageHeight = 0;
int currentPageToLocate = 0;

int experimentSet = 1;
int pageToLocateInList = 0;
ArrayList<Integer> listOfExperiment1Pages = new ArrayList<Integer>();
ArrayList<Integer> listOfExperiment2Pages = new ArrayList<Integer>();

int experimentCounter =0;

public void runExperiment1()
{
  listOfExperiment1Pages = new ArrayList<Integer>(); 

  listOfExperiment1Pages.add(3);
  listOfExperiment1Pages.add(15);
  listOfExperiment1Pages.add(17);
  listOfExperiment1Pages.add(11);
  listOfExperiment1Pages.add(21);
  listOfExperiment1Pages.add(20);
  listOfExperiment1Pages.add(13);
  listOfExperiment1Pages.add(28);
  listOfExperiment1Pages.add(0);
  listOfExperiment1Pages.add(25);
  
  listOfExperiment1Pages.add(28);
  listOfExperiment1Pages.add(15);
  listOfExperiment1Pages.add(17);
  listOfExperiment1Pages.add(20);
  listOfExperiment1Pages.add(3);
  listOfExperiment1Pages.add(20);
  listOfExperiment1Pages.add(0);
  listOfExperiment1Pages.add(21);
  listOfExperiment1Pages.add(11);
  listOfExperiment1Pages.add(13);

  listOfExperiment1Pages.add(17);
  listOfExperiment1Pages.add(11);
  listOfExperiment1Pages.add(3);
  listOfExperiment1Pages.add(28);
  listOfExperiment1Pages.add(13);
  listOfExperiment1Pages.add(0);
  listOfExperiment1Pages.add(25);
  listOfExperiment1Pages.add(13);
  listOfExperiment1Pages.add(15);
  listOfExperiment1Pages.add(20);
  
  listOfExperiment1Pages.add(11);
  listOfExperiment1Pages.add(28);
  listOfExperiment1Pages.add(13);
  listOfExperiment1Pages.add(15);
  listOfExperiment1Pages.add(0);
  listOfExperiment1Pages.add(13);
  listOfExperiment1Pages.add(17);
  listOfExperiment1Pages.add(20);
  listOfExperiment1Pages.add(0);
  listOfExperiment1Pages.add(11);
  
  listOfExperiment1Pages.add(15);
  listOfExperiment1Pages.add(11);
  listOfExperiment1Pages.add(28);
  listOfExperiment1Pages.add(13);
  listOfExperiment1Pages.add(0);
  listOfExperiment1Pages.add(17);
  listOfExperiment1Pages.add(3);
  listOfExperiment1Pages.add(17);
  listOfExperiment1Pages.add(20);
  listOfExperiment1Pages.add(20);
  
  listOfExperiment1Pages.add(11);
  listOfExperiment1Pages.add(20);
  listOfExperiment1Pages.add(17);
  listOfExperiment1Pages.add(13);
  listOfExperiment1Pages.add(15);
  listOfExperiment1Pages.add(28);
  listOfExperiment1Pages.add(0);
  listOfExperiment1Pages.add(11);
  listOfExperiment1Pages.add(3);
  listOfExperiment1Pages.add(25);

  

  pageToLocateInList = 0;
  currentPageToLocate = 0;
  
  experimentSet = 1;
  experimentPage = 0;
  experimentPreviewPageWidth = displayWidth*previewSliderRatioOfWindow - 10;
  experimentPreviewPageHeight = experimentPreviewPageWidth*aspectRatio;
  experimentCounter = 0;
  drawAgain = true;
  nOfIcons = 30;
  windowInitializer();
  sizeOfIconsCalculator();
  experimentRunning = true;
  startedRunningExpe = true;
  startTimer = true;
  println("experiment 1 started");
  currentPageToLocate = listOfExperiment1Pages.get(0);
}

public void runExperiment2()
{
  listOfExperiment1Pages = new ArrayList<Integer>(); 

  listOfExperiment1Pages.add(27);
  listOfExperiment1Pages.add(8);
  listOfExperiment1Pages.add(41);
  listOfExperiment1Pages.add(74);
  listOfExperiment1Pages.add(97);
  listOfExperiment1Pages.add(77);
  listOfExperiment1Pages.add(46);
  listOfExperiment1Pages.add(55);
  listOfExperiment1Pages.add(54);
  listOfExperiment1Pages.add(117);
  listOfExperiment1Pages.add(106);
  listOfExperiment1Pages.add(59);
  listOfExperiment1Pages.add(100);
  listOfExperiment1Pages.add(75);
  listOfExperiment1Pages.add(61);

  
  listOfExperiment1Pages.add(27);
  listOfExperiment1Pages.add(8);
  listOfExperiment1Pages.add(41);
  listOfExperiment1Pages.add(74);
  listOfExperiment1Pages.add(97);
  listOfExperiment1Pages.add(77);
  listOfExperiment1Pages.add(46);
  listOfExperiment1Pages.add(55);
  listOfExperiment1Pages.add(54);
  listOfExperiment1Pages.add(117);
  listOfExperiment1Pages.add(106);
  listOfExperiment1Pages.add(59);
  listOfExperiment1Pages.add(100);
  listOfExperiment1Pages.add(75);
  listOfExperiment1Pages.add(61);

  listOfExperiment1Pages.add(27);
  listOfExperiment1Pages.add(8);
  listOfExperiment1Pages.add(41);
  listOfExperiment1Pages.add(74);
  listOfExperiment1Pages.add(97);
  listOfExperiment1Pages.add(77);
  listOfExperiment1Pages.add(46);
  listOfExperiment1Pages.add(55);
  listOfExperiment1Pages.add(54);
  listOfExperiment1Pages.add(117);
  listOfExperiment1Pages.add(106);
  listOfExperiment1Pages.add(59);
  listOfExperiment1Pages.add(100);
  listOfExperiment1Pages.add(75);
  listOfExperiment1Pages.add(61);
  
  listOfExperiment1Pages.add(27);
  listOfExperiment1Pages.add(8);
  listOfExperiment1Pages.add(41);
  listOfExperiment1Pages.add(74);
  listOfExperiment1Pages.add(97);
  listOfExperiment1Pages.add(77);
  listOfExperiment1Pages.add(46);
  listOfExperiment1Pages.add(55);
  listOfExperiment1Pages.add(54);
  listOfExperiment1Pages.add(117);
  listOfExperiment1Pages.add(106);
  listOfExperiment1Pages.add(59);
  listOfExperiment1Pages.add(100);
  listOfExperiment1Pages.add(75);
  listOfExperiment1Pages.add(61);
  
  listOfExperiment1Pages.add(27);
  listOfExperiment1Pages.add(8);
  listOfExperiment1Pages.add(41);
  listOfExperiment1Pages.add(74);
  listOfExperiment1Pages.add(97);
  listOfExperiment1Pages.add(77);
  listOfExperiment1Pages.add(46);
  listOfExperiment1Pages.add(55);
  listOfExperiment1Pages.add(54);
  listOfExperiment1Pages.add(117);
  listOfExperiment1Pages.add(106);
  listOfExperiment1Pages.add(59);
  listOfExperiment1Pages.add(100);
  listOfExperiment1Pages.add(75);
  listOfExperiment1Pages.add(61);

  

  pageToLocateInList = 0;
  currentPageToLocate = 0;
  
  experimentSet = 2;
  experimentPage = 0;
  experimentPreviewPageWidth = displayWidth*previewSliderRatioOfWindow - 10;
  experimentPreviewPageHeight = experimentPreviewPageWidth*aspectRatio;
  experimentCounter = 0;
  drawAgain = true;
  nOfIcons = 120;
  windowInitializer();
  sizeOfIconsCalculator();
  experimentRunning = true;
  startedRunningExpe = true;
  startTimer = true;
  println("experiment 2 started");
  currentPageToLocate = listOfExperiment1Pages.get(0);
}


public void continueExpe()
{
  while(pageToLocateInList < listOfExperiment1Pages.size()-1)
  {
    experimentPage = experimentPage+1;
    firstExperimentInit = true;
    pageToLocateInList = pageToLocateInList+1;
    currentPageToLocate = listOfExperiment1Pages.get(pageToLocateInList);
    startTimer = true;
    return;
  }
  stopExperiment();
}


 public void stopExperiment()
  {
      pageToLocateInList = 0;
      currentPageToLocate = 0;
  
      experimentSet = 1;
      experimentPage = 0;
      experimentPreviewPageWidth = 0;
      experimentPreviewPageHeight = 0;
      experimentCounter = 0;
      experimentRunning = false;
      startedRunningExpe = false;
      listOfExperiment1Pages = new ArrayList<Integer>(); 
  }