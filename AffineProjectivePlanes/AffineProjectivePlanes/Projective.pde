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
  int linesThroughPoint = order+1;        //Number of lines through a point
  int pointsOnLine = order+1;             //Number of points on a line
  int numPoints = (order*order)+order+1;  //Number of lines
  int numLines  = (order*order)+order+1;  //Number of lines, distinguished from numPts for the sake of comprehension
  
  PVector[] points;                       //Stores an array of PVectors with x,y coords of each
  int  [][] lines;                        //Stores a 2d array of ints. Rows corrospond to lines and columns corrospond to combinations of points
  
  ProjectivePlane(int temporder)
  {
    order = temporder;
    lines = new int[numLines][pointsOnLine];
    points = new PVector [numPoints];
  }
  
  void updateProjective()
  {
    
  }
  
  void drawProjective()
  {
    
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
        {lines [i][j] = 0;}}
  }
}