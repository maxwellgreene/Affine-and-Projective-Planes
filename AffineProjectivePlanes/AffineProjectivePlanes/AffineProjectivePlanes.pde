int order = 3;

int tempMovingPoint = 0;

float pointRadius = 5;
float pointSenseRadius = 10;
float lineThickness = 2;

boolean affineType = false;
boolean projectiveType = true;

ProjectivePlane projective = new ProjectivePlane (order);
AffinePlane affine = new AffinePlane (order);

void setup()
{
  size(1000,1000);
  ellipseMode(CENTER);
  projective.initializeValues();  projective.randomize(50.0,width-50.0,50.0,height-50.0,true,true);
  affine.initializeValues();      affine.randomize(50.0,width-50.0,50.0,height-50.0,true,true);
  
}

void draw()
{
  background(85,200,120);
  drawGUI();
  if(affineType)
  {
    affine.drawAffine();
  }
  
  if(projectiveType)
  {
    projective.drawProjective();
  }
}

//=====TO DO=====
//==
//== NOTE: RANDOMIZE DOES NOT MAKE A CORRECT PROJECTIVE OR AFFINE PLANE
//== Proper randomization of lines (based off of fano plane geomatry?)
//==
//== MAKE advance() work
//==
//== ORGANIZE