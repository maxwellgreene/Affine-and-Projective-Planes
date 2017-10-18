int order = 2;

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
  size(600,600);
  ellipseMode(CENTER);
  projective.initializeValues();  projective.randomize(50.0,width-50.0,50.0,height-50.0,true,true);
  affine.initializeValues();      affine.randomize(50.0,width-50.0,50.0,height-50.0,true,true);
  
}

void draw()
{
  background(120,105,200);
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
//== NOTE: RANDOMIZE DOES NOT MAKE A CORRECT AFFINE PLANE
//== Proper randomization of lines (based off of fano plane geomatry?)
//==
//== MAKE advance() work
//==
//==