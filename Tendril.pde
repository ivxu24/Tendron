class Tendril {
  public final static int SEG_LENGTH = 4; //length of each segment in the tendril
  private int myNumSegments, myX, myY;
  private double myAngle;
  
  /**
   Class constructor
   len is how many segments in this tendril (each a fixed length, 4 is a good start)
   theta is tendril starting angle in radians 
   x, y  is the starting (x,y) coordinate
   */
  public Tendril(int len, double theta, int x, int y) {
    myNumSegments = len;
    myAngle = theta;
    myX = x;
    myY = y;
  }
  
  public void show() {
    if (myNumSegments >= 20)
      stroke(130, 50, 45);
    else if (myNumSegments >= 12)
      stroke(15, 255, 15);
    else
      stroke(55, 9, 5);
      
    float startX = myX;
    float startY = myY;
    int endX = 0;
    int endY = 0;
    
    for (int i = 0; i < myNumSegments; i++) {
      myAngle += (float) (Math.random() * 0.4)-0.2 ;
      endX = (int) (startX + Math.cos(myAngle) * SEG_LENGTH);
      endY = (int) (startY + Math.sin(myAngle) * SEG_LENGTH);
      line(startX, startY, endX, endY);
      startX = endX;
      startY = endY;
    }
    
    if (myNumSegments >= 3) {
      Cluster c2  = new Cluster((int) (myNumSegments/3.5), endX, endY);
    }
  }
}
