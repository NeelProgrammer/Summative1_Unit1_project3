int score = millis();
int size = 50;
int X = 0; 
int Y = 400;
boolean imalive= true;
boolean setscore = false;
int hail = 30;
float[] XSps = new float[hail];
int Move = 20;
float[] Sps = new float[hail];
float[] Xs = new float[hail];
float[] Ys = new float[hail];
PImage myimgsp;
PImage myimgsp2;

void setup()
{
  size(800, 800);
  myimgsp = loadImage("Car.png");
  myimgsp2 = loadImage("game_over.png");
  imageMode(CENTER);

  for (int i=0; i< hail; i++)
  {
    Xs[i] = random(width);
    Ys[i] = random(width);
    Sps[i] = 1;
    XSps[i] = 1;
  }
}

void draw()
{
  
  
  
  background(0);
  image(myimgsp, X, Y, size, 25);

  for (int i = 0; i< hail; i++)
  {

    rect(Xs[i], Ys[i], 5, 5);
    Ys[i] = Ys[i] + Sps[i];
    Xs[i] = Xs[i] + XSps[i];  
    if (Ys[i] > height)
    {
      Sps[i] = Sps[i] * -1;
      fill(random(255), random(255), random(255));
      Xs[i] = random(width);
    }
    if (Ys[i] < 0)
    {
      Sps[i] = Sps[i] * -1;
    }
    if (Xs[i] > width)
    {
      XSps[i] = XSps[i] * -1;
    }
    if ( Xs[i] < 0)
    {
      XSps[i] = XSps[i] * -1;
    }
   
    if (dist(Xs[i], Ys[i], X, Y) < (25 + 2.5))
    { 
  
      imalive = false;
      setscore = true;
    }
    if (imalive == false)
    {
      textSize(100);
      text("game over", 100, 100);
      size = 0;
      Sps[i] = 0;
      
    }
    if (setscore == false )
    {
      textSize(10);
      text(millis(), 700, 700);
    }
    if(X < 0)
    {
      X = width;
    }else if (X > width)
  {
    X = 0;
  }else if( Y < 0)
  {
    Y = height;
  }else if( Y > height)
  {
    Y = 0;
  }
  }
  if (keyPressed) 
  {
    if (key == ' ')
    {
      Move = 15;
    }
    if (score > millis()-1)
    {
      text("level up", 100, 100);
      Move = 15;
    }
    
  }
}
void keyPressed()
{
  if (key == 'w')
  {
    Y = Y -Move;
  } else if (key == 'a')
  {
    X = X -Move;
  } else if (key == 's')
  {
    Y = Y +Move;
  } else if (key == 'd')
  {
    X = X + Move;
  }
  if (key == '\n')
  {
    
  }
}