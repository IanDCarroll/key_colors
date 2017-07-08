float size = 40;
ArrayList<Pour> pourList = new ArrayList<Pour>();
char[] title;
int startTime;

void setup(){
  size(500, 500);
  fill(255, 0, 0);
  text("type to paint", width/2 - 25, height/2 + 50);
  String[] lines = loadStrings("http://shakespeare.mit.edu/Poetry/sonnet.XLIII.html"); 
  title = lines[0].toCharArray();
  frameRate(60);
  startTime = millis();
}

void draw(){
  for(int i = 0; i < pourList.size(); i++){ 
    Pour pour = pourList.get(i);
    pour.incrementSize();
    pour.display();
  }
}

void keyPressed(){
  Pour pour = new Pour(color(map((int(key)), 32, 127, 0, 255),0,map((int(key)), 32, 127, 0, 255)), 
                         size, 
                         mouseX, 
                         mouseY);
  pourList.add(pour); 
}

class Pour {
  color pourColor;
  float pourSize;
  int x;
  int y;
  
  Pour(color tempColor, float tempSize, int mx, int my){
    pourColor = tempColor;
    pourSize = tempSize;
    x = mx;
    y = my;
  }
  
  void display(){
    noStroke();
    fill(pourColor);
    ellipse(x, y, pourSize, pourSize);
  }
  
  void incrementSize(){
    pourSize += 1;
  }
  
  boolean largerThanScreen(){
    if(pourSize > 1500) {
      return true;
    } else {
      return false;
    }
  }
}