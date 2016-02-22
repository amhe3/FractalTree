private double fractionLength = .9; 
private int smallestBranch = 5;
private double branchAngle = .40;
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);
	stroke(151, 103, 20);  
	line(320,480,320,350); //380   
	drawBranches(320, 350, 100, 3*Math.PI/2);  //will add later 
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	int r = 151;
	int g = 103;
	int b = 20;
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength *= fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1)+x);
	int endY1 = (int)(branchLength*Math.sin(angle1)+y);
	int endX2 = (int)(branchLength*Math.cos(angle2)+x);
	int endY2 = (int)(branchLength*Math.sin(angle2)+y);
	if(branchLength < 15)
	{
		r = 0;
		g = 153;
		b = 0;
	}
	stroke(r, g, b);
	line(x, y, endX1, endY1);
	stroke(r, g, b);
	line(x, y, endX2, endY2);
	
	if(branchLength > smallestBranch)
	{
		drawBranches(endX1, endY1, branchLength*0.75, angle1);
		drawBranches(endX2, endY2, branchLength*0.75, angle2);
	}
		
} 
