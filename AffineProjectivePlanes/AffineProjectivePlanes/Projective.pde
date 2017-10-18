class ProjectivePlane
{
  /**
    A projective plane is defined as:
    
    Order                             N
    Number of points on a line        N+1
    Number of lines through a point   N+1
    Number of points                  N^2+N+1
    Number of lines                   N^2+N+1
  **/
  
  
  int order;                              //Order or "size" of projective plane
  int linesThroughPoint;                  //Number of lines through a point
  int pointsOnLine;                       //Number of points on a line
  int numPoints;                          //Number of lines
  int numLines;                           //Number of lines, distinguished from numPts for the sake of comprehension
  
  PVector[] points = new PVector [numPoints];                       //Stores an array of PVectors with x,y coords of each
  int  [][] lines;                        //Stores a 2d array of ints. Rows corrospond to lines and columns corrospond to combinations of points
  
  ProjectivePlane(int temporder)
  {
    order = temporder;
    linesThroughPoint = order+1;
    pointsOnLine = order+1;
    numPoints = (order*order)+order+1;
    numLines  = (order*order)+order+1;
    lines = new int [numLines][pointsOnLine];
    points = new PVector [numPoints];
  }
  
  void updateProjective(float mousex, float mousey, int pointNum)
  {
    points[pointNum].set(mousex,mousey);
  }
  
  void drawProjective()
  {
    //==LINES==
    for(int i=0;i<numLines;i++)
    {
      for(int j=0;j<pointsOnLine-1;j++)
      {
        stroke((j/lines.length));
        strokeWeight(lineThickness);
        line(points[lines[i][j]].x,points[lines[i][j]].y,points[lines[i][j+1]].x,points[lines[i][j+1]].y);
      }
    }
    //==POINTS==
    for(int i=0;i<points.length;i++)
    {
      stroke(255);
      strokeWeight(pointRadius);
      point(points[i].x,points[i].y);
      text(i,points[i].x,points[i].y);
    }
    overPoint();
  }
  
  void overPoint()
  {
    for(int i=0;i<points.length;i++)
    {
      if(mouseX>(points[i].x-pointSenseRadius) && mouseX<(points[i].x+pointSenseRadius) && mouseY>(points[i].y-pointSenseRadius) && mouseY<(points[i].y+pointSenseRadius))
      {
        noFill(); stroke(255);
        ellipse(points[i].x,points[i].y,pointRadius,pointRadius);
      }
    }
  }
  
//========================================
//====Clears value of points and lines====
//========================================
  void clearValues()
  {
    for(int i=0;i<numPoints;i++)
    {points [i].set(0,0);}
    
    for(int i=0;i<numLines;i++){
      for(int j=0;j<pointsOnLine;j++)
        {lines [i][j] = 0;}}//{lines [i][j] = (i+j)%numPoints;}}
  }
//========================================
//===========INITIALIZE POINTS============
//========================================
  void initializeValues()
  {
    println("Initializing projective values.");
    for(int i=0;i<numPoints;i++){points [i] = new PVector (0,0);}
  }  
//========================================
//=======RANDOMIZE POINTS AND LINES=======
//========================================
  void randomize(float minX, float maxX, float minY, float maxY)
  {
    for(int i=0;i<numPoints;i++)
    {points [i].set(int(random(minX,maxX)),int(random(minY,maxY)));}
    for(int i=0;i<numLines;i++){
      for(int j=0;j<pointsOnLine;j++)
        {lines [i][j] = int(random(0,numPoints));}}
  }
}