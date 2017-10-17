void drawGUI()
{
  fill(255);
  if(affineType)
  {
    rect(10,height-30,112,20);
    fill(0);
    text("Switch to projective",15,height-15);
  }
  if(projectiveType)
  {
    rect(10,height-30,112,20);
    fill(0);
    text("Switch to affine",15,height-15);
  }
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
    println("pressed");
  }
}