import netP5.*;
import oscP5.*;
import codeanticode.syphon.*;
import java.util.*;

PImage img;
SyphonClient client;
OscP5 oscp5;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(640, 480, P3D);
  oscp5 = new OscP5(this, 8338);
  client = new SyphonClient(this);
}

void draw() {
  if (client.newFrame()) {
    img = client.getImage(img, false); // does not load the pixels array (faster)
  }
  if (img != null) {
    image(img, 0, 0, width, height);
  }

  for (int i=0; i < points.size(); i++) {
    stroke(255);
    strokeWeight(5);
    // PVector p = new PVector(points[i], points[i+1]);
    point(points.get(i).x, points.get(i).y);
    text(i, points.get(i).x, points.get(i).y);
  }
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/raw") == true) {
    points.clear();
    for (int i = 0; i < 132; i+=2) {
      float p1 = theOscMessage.get(i).floatValue();
      float p2 = theOscMessage.get(i+1).floatValue();
      points.add(new PVector(p1, p2));
    }
  }
}