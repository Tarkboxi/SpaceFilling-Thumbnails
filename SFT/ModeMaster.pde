boolean systemStarted = false;
boolean experimentMode = false;
boolean initialRun = true;

public void switchMode()
{
  spatialOn = !(spatialOn);
}

  public void FreeRun()
  {
    if (initialRun)
    {
      return;
    }
    systemStarted = true;
    cp5.setAutoDraw(true);
    backToMainButton.setAutoDraw(true);
    experimentResetButton.setAutoDraw(false);
  }
  
    public void Experiment()
  {
    if (initialRun)
    {
      initialRun = false;
      return;
    }
    systemStarted = true;
    experimentMode = true;
    backToMainButton.setAutoDraw(true);
    experimentResetButton.setAutoDraw(true);
  }

public void runMenuScreen()
{
  backToMainButton.setAutoDraw(false);
  cp5.setAutoDraw(false);
  background(0);   
  initScreenButtons.addButton("FreeRun").setPosition( (displayWidth/2)-300,(displayHeight/2)-25 ).setSize(200,50).setValue(0).activateBy(ControlP5.PRESS).setId(1);
  initScreenButtons.addButton("Experiment").setPosition( (displayWidth/2),(displayHeight/2)-25 ).setSize(200,50).setValue(0).activateBy(ControlP5.PRESS).setId(2);
  initScreenButtons.setAutoDraw(true);
}