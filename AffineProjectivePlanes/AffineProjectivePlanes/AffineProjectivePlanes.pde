int order = 3;

int tempMovingPoint = 0;

float pointRadius = 5;
float pointSenseRadius = 10;
float lineThickness = 2;

boolean affineType = true;
boolean projectiveType = false;

ProjectivePlane projective = new ProjectivePlane (order);
AffinePlane affine = new AffinePlane (order);

void setup()
{
  size(600,600);
  ellipseMode(CENTER);
  projective.initializeValues();
  affine.initializeValues();
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
//== MAKE createFanoPlane()