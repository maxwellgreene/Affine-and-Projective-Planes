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
  float temp = 0;
  
  PVector[] points = new PVector [numPoints];//Stores an array of PVectors with x,y coords of each
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
  
  void createProjectiveAlgebraically()
  {
    
  }
  
  void createFanoPlane()
  {
    points[0].set(width/2,height/2);
    points[1].set((width/2),(height/2)-100);
    points[2].set((width/2)+100,(height/2)+75);
    points[3].set((width/2)-100,(height/2)+75);
    points[4].set((width/2),(height/2)+75);
    points[5].set((width/2)-50,(height/2)-50);
    points[6].set((width/2)+50,(height/2)-50);
    
    lines[0][0] = 1;  lines [0][1] = 5;  lines [0][2] = 3;
    lines[1][0] = 1;  lines [1][1] = 0;  lines [1][2] = 4;
    lines[2][0] = 1;  lines [2][1] = 6;  lines [2][2] = 2;
    lines[3][0] = 5;  lines [3][1] = 6;  lines [3][2] = 4;
    lines[4][0] = 5;  lines [4][1] = 0;  lines [4][2] = 2;
    lines[5][0] = 3;  lines [5][1] = 0;  lines [5][2] = 6;
    lines[6][0] = 3;  lines [6][1] = 4;  lines [6][2] = 2;
    
  }
  
  void drawProjective()
  {
    //==LINES==
    for(int i=0;i<numLines;i++)
    {
      for(int j=0;j<pointsOnLine-1;j++)
      {
        temp = i;
        stroke((temp/numLines)*255,85,100);
        strokeWeight(lineThickness);
        line(points[lines[i][j]].x,points[lines[i][j]].y,points[lines[i][(j+1)%pointsOnLine]].x,points[lines[i][(j+1)%pointsOnLine]].y);
      }
    }
    //==POINTS==
    for(int i=0;i<points.length;i++)
    {
      stroke(255);
      strokeWeight(pointRadius);
      point(points[i].x,points[i].y);
      //text(i,points[i].x,points[i].y);
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
  void randomize(float minX, float maxX, float minY, float maxY,boolean doPoints, boolean doLines)
  {
    if(doPoints)
    {
      for(int i=0;i<numPoints;i++)
      {points [i].set(int(random(minX,maxX)),int(random(minY,maxY)));}
    }
    if(doLines)
    {
    for(int i=0;i<numLines;i++){
      for(int j=0;j<pointsOnLine;j++)
        {lines [i][j] = int(random(0,numPoints));}}
    }
  }
}