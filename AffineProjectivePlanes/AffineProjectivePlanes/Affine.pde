class AffinePlane
{
  /*
    A projective plane is defined as:
    
    Order                             N
    Number of points on a line        N
    Number of lines through a point   N+1
    Number of points                  N^2
    Number of lines                   N^2+N
  */
  
  int order;                              //Order or "size" of projective plane
  int pointsOnLine = order;               //Number of points on a line
  int linesThroughPoint = order+1;        //Number of lines through a point
  int numPoints = (order*order);          //Number of lines
  int numLines  = (order*order)+order;    //Number of lines, distinguished from numPts for the sake of comprehension
  
  PVector[] points;                       //Stores an array of PVectors with x,y coords of each
  int  [][] lines;                        //Stores a 2d array of ints. Rows corrospond to lines and columns corrospond to combinations of points
  
  AffinePlane(int temporder)
  {
    order = temporder;
    lines = new int[numLines][pointsOnLine];
    points = new PVector [numPoints];
  }
  
  void updateAffine()
  {
    
  }
  
  void drawAffine()
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