float noise_scale = 0.0025;
int step=10;
int count;
int mainColor = color(54, 128, 247); //Don't need all these individual variables, but keeping it organized
int secondColor = color(60, 247, 53);
int thirdColor = color(247, 53, 53);
int foruthColor = color(247, 53, 162);
int fithColor = color(244, 244, 66);
int sixthColor = color(149, 65, 244);
int[] colorSelector = {mainColor, secondColor, thirdColor, foruthColor, fithColor, sixthColor};
int selected = int(random(colorSelector.length)); //Set its init color

void setup(){
  size(1280, 720);
  smooth(2);
  noStroke();
  noFill();
  count = (int)(width*1.5/step); //Selected var, width x 1.5 divided by step(which is 20);
  background(255);
}

void drawLine (float x, float y, float phase, float step, int count, color barColor){
  pushStyle(); //Saves the current style, to allow for a new style to be implemented
  stroke(barColor);
  beginShape(); //Using the beginShape() and endShape() functions allow creating more complex forms. beginShape() begins recording vertices for a shape and endShape() stops recording.
    for (int i=0; i<count; i++) {
    curveVertex(x, y);//Specifies vertex coordinates for curves. This function may only be used between beginShape() and endShape()
    float angle = 10*PI*noise(x * noise_scale + 250, y * noise_scale + 250, phase * noise_scale + width); //  Returns the Perlin noise value at specified coordinates. Pi helps it looks more rounded when rendering.
    x += cos(angle)*step-10;// Location
    y += sin(angle)*step+10; //Location
  }
  endShape(); //Ends the pushStyle()
  popStyle(); //Start a new one
}
void mouseClicked(){
  //Basic click fucntion to randomize the color, instead of it randomizing automatically
  int arrLength = colorSelector.length - 1;
  if(selected < arrLength){
    selected++;
} else {
  selected = 0;
}
}
public void draw() {
//int selected = int(random(colorSelector.length)); //Uncommenting this will constantly randomize the stroke, aka a seizure case
pushStyle();
fill(255, 50);
rect(0,0,width, height);
popStyle();
float phase = frameCount / 1.5;
    for (int y = 0; y < height; y+=15) {
    color barColor = colorSelector[selected];
        drawLine(width+18, y, phase, step, count, barColor);
     
  }
}