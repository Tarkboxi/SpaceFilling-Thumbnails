boolean waitingforLoad = false;
boolean startedRunningExpe = false;
boolean startTimer = false;

boolean firstExperimentInit = true;

int startTime = 0;
int endTime = 0;
int elapsedTime = 0;

 double experimentPreviewPageWidth = 0;
 double experimentPreviewPageHeight = 0;
int currentPageToLocate = 0;

int experimentSet = 1;
int experimentPage = 0;
int pageToLocateInList = 0;
  ArrayList<Integer> listOfExperimentPages = new ArrayList<Integer>();
int experimentCounter =0;

public void runExperiment()
{
  println("initialized experiment variables");
  listOfExperimentPages.add(3);
  listOfExperimentPages.add(17);
  listOfExperimentPages.add(21);
  listOfExperimentPages.add(13);
  listOfExperimentPages.add(6);
  listOfExperimentPages.add(20);
  listOfExperimentPages.add(29);
  listOfExperimentPages.add(0);
  listOfExperimentPages.add(7);
  listOfExperimentPages.add(12);


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
  println("experiment started");
}

public void continueExpe()
{
  while(pageToLocateInList < 10)
  {
    firstExperimentInit = true;
    pageToLocateInList = pageToLocateInList+1;
    currentPageToLocate = listOfExperimentPages.get(pageToLocateInList);
    startTimer = true;
    println("init done, it shouldve changed now");
    return;
  }
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
  }