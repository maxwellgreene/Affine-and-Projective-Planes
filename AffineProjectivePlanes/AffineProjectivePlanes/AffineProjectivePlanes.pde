int order = 2;

boolean affineType = true;
boolean projectiveType = false;

ProjectivePlane projective = new ProjectivePlane (order);
AffinePlane affine = new AffinePlane (order);

void setup()
{
  size(600,600);
}

void draw()
{
  background(120,105,200);
  drawGUI();
  if(affineType)
  {
    affine.updateAffine();
    affine.drawAffine();
  }
  if(projectiveType)
  {
    projective.updateProjective();
    projective.drawProjective();
  }
}