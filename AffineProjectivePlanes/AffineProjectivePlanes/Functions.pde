void createFanoPlane()
{
  projective.clearValues();
  projective.createFanoPlane();
}

void randomAffine(boolean doPoints, boolean doLines)
{
  //affine.clearValues();
  affine.randomize(50.0,width-50.0,50.0,height-50.0,doPoints,doLines);
}

void randomProjective(boolean doPoints, boolean doLines)
{
  //projective.clearValues();
  projective.randomize(50.0,width-50.0,50.0,height-50.0,doPoints,doLines);
}