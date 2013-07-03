ListenSensors listenSensors;
PFont arial;
int PartScreen;
boolean drawing=true;
int screen=0;
int whereX,whereY;

void setup()
{
  listenSensors= new ListenSensors();
  listenSensors.ReadAllSensors();
  background(255, 0, 0);
  arial = loadFont("arial.vlw");
  textFont(arial, 12);
  PartScreen= height/listenSensors.NumberOfSensors();
}

void DrawAllSensors()
{
background(255, 0, 0);
for(int i=1; height>PartScreen*i; i++)
  {
  int j=255*i/listenSensors.NumberOfSensors();
  fill(j,0,0);
  rect(0, PartScreen*(i-1),width, PartScreen);
  listenSensors.SetSensor(i-1);
  fill(255,255,255);
  text(listenSensors.GetName(),10,(int)(PartScreen/2)+(PartScreen*(i-1)));
  }
  fill(0,255,0);
  rect(0,0,8,height);

}
void DrawOneSensor()
{
  fill(255,255,255);
  println("In drawOneSensor func");
  background(255, 0, 0);
  text("Name: "+listenSensors.GetName(),10,10);
  text("Type: "+listenSensors.GetType(),10,30);
  text("Version: "+listenSensors.GetVersion(),10,50);
  text("Max range: "+listenSensors.GetMaxRange(),10,70);
  text("Min delay: "+listenSensors.GetMinDelay(),10,90);
  text("Used power: "+listenSensors.GetPower()+" [mA]",10,110);
  fill(0,255,0);
  rect(width-40,height-40,40,40);
}

void draw()
{  
  if(drawing==true) //screen drawn once
  {
    if(screen==0)
      DrawAllSensors();
    else if(screen==1)
      DrawOneSensor();
  drawing=false;
  }
  
  if(screen==0) //moving rect for option
  {
    fill(0,255,0);
    rect(0,0,8,height);
    pushMatrix();
      translate(0,(mouseY/PartScreen)*PartScreen);
      fill(0,0,255);
      rect(0,0,8,PartScreen);
    popMatrix();
  }
}

void mousePressed()
{
}
void mouseReleased()
{
  whereX=mouseX;
  whereY=mouseY;
  ShowClicked();
}
void ShowClicked()
{
  println("screen:"+screen);
  if(screen==0) //check which sensor was clicked and change to Screen Info
  {
    println("Height: "+height+" whereY: "+whereY+" partScreen: "+PartScreen);
    int i=whereY/PartScreen;
    println("Choosen device: "+i);
    if(listenSensors.SetSensor(i))
    {
      screen=1;
      drawing=true;
    }
  }
  else //check button click to back screen
  {
    if(whereX>=(width-40) && whereY>=(height-40))
    {
    screen=0;
    drawing=true;
    }
  }
  
}

