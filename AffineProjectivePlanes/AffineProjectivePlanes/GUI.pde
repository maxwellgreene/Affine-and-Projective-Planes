void drawGUI()
{
  stroke(255);
  fill(255);
  if(affineType)
  {
    fill(255);  rect(10,height-30,112,20);
    fill(0);    text("Switch to projective",15,height-15);
    
    fill(255);  rect(132,height-30,157,20);
    fill(0);    text("Generate random affine",137,height-15);
  }
  if(projectiveType)
  {
    fill(255);  rect(10,height-30,112,20);
    fill(0);    text("Switch to affine",15,height-15);
    
    fill(255);  rect(132,height-30,157,20);
    fill(0);    text("Generate random projective",137,height-15);
  }
  
  textSize(11.5);
  text("Press 'a' to advance lines. (alpha)",10,25);
  text("Press 'p' to randomize points.",10,45);
  text("Press 'l' to randomize lines.",10,65);
  if(projectiveType){text("Press 'f' to generate a Fano plane.",10,85);}
}

void mousePressed()
{
//========================================
//====Switch btw affine and projective====
//========================================
  if(mouseX>10 && mouseX<122 && mouseY>(height-30) && mouseY<(height-10))
  {
    affineType = !affineType;
    projectiveType = !projectiveType;
    println("Switching between affine nad projective planes.");
  }
//========================================
//====Generate random affine/projective===
//========================================
  if(affineType && mouseX>132 && mouseX<289 && mouseY>(height-30) && mouseY<(height-10))
  {randomAffine(true,true);     println("Generating random affine plane.");}
  if(projectiveType && mouseX>132 && mouseX<289 && mouseY>(height-30) && mouseY<(height-10))
  {randomProjective(true,true); println("Generating random projective plane.");}
}

void mouseDragged()
{
  if(affineType)
    {
      affine.checkAbove();
    }
  if(projectiveType)
  {
    for(int i=0;i<projective.points.length;i++)
      {
        if(mouseX>(projective.points[i].x-pointSenseRadius) && mouseX<(projective.points[i].x+pointSenseRadius) && mouseY>(projective.points[i].y-pointSenseRadius) && mouseY<(projective.points[i].y+pointSenseRadius))
        {projective.updateProjective(mouseX,mouseY,i);}
      }
  }
}

void keyPressed()
{
  //==CURRENT CONTROLS==
  //==
  //== F - CREATE FANO PROJECTIVE PLANE
  //==
  //== P - RANDOMIZE POINTS ONLY
  //==  (will be correct projective if pressed F first)
  //==
  //== L - RANDOMIZE LINES ONLY
  //==
  //== A - CREATE PLANE ALGEBRAICALLY
  
  
  if(keyCode == 70)
  {
    if(order == 2 && projectiveType)
    {
      println("pressed f");
      println("Creating Fano Plane!");
      createFanoPlane();
    }else{
      println("Cannot create Fano plane, you must be in a projective plane and of order 2!");
    }
  }
  if(keyCode == 80)
  {
    if(affineType)
    {randomAffine(true,false);}
    if(projectiveType)
    {randomProjective(true,false);}
  }
  if(keyCode == 76)
  {
    if(affineType)
    {randomAffine(false,true);}
    if(projectiveType)
    {randomProjective(false,true);}
  }
  if(keyCode == 65)
  {
    if(affineType)
    {}
    if(projectiveType)
    {
      projective.createProjectiveAlgebraically();
    }
  }
}