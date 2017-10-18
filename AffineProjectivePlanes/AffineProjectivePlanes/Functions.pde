void createFanoPlane()
{
  projective.clearValues();
  projective.createFanoPlane();
}

void randomAffine()
{
  affine.clearValues();
  affine.randomize(50.0,width-50.0,50.0,height-50.0);
}

void randomProjective()
{
  projective.clearValues();
  projective.randomize(50.0,width-50.0,50.0,height-50.0);
}