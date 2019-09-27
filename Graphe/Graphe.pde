import java.util.*;
Graph graph;
noeud n;
int k =0;//le nombre de noued
int id=0;
int h = 25;
float angle = 0;
noeud n1, n2;
int x, y, x0, y0, firstPress = 1;

void setup(){
  size(800, 600);
  background(255);
  graph=new Graph(); 
 
}
//dessiner les noued 
void drawGraph(){
 stroke(60, 12, 10);
 for(noeud n : graph.list){
    noFill();
    ellipse(graph.list.indexOf(n)*50+50, h, 25, 25);   
  }
 
}
void draw(){
  //pour dessiner les arcs  
  if (mousePressed == true && firstPress == 1) {
    firstPress = 0;
    x0 = mouseX;
    y0 = mouseY;
    point(x0, y0);
  }
  if (mousePressed == true && firstPress == 0) {
 
    x = mouseX;
    y = mouseY;
    point(x, y);
    line(x0, y0, x, y);
    x0 = x;
    y0 = y;
  }
  
  //dessiner les nouedd
   for(noeud n : graph.list){
    stroke(0, 0, 255);
    fill(255, 0, 0);
    ellipse(n.x, n.y, n.r *5, n.r *5);
    fill(0);
    //centrer le texte 
    textAlign(CENTER, CENTER);
    text(n.toString(), n.x, n.y);
  }
  
}
/************************************************************************************************/

//recuperer les x,y
void mousePressed(){
  if (mouseButton == LEFT) {
    noeud n = graph.XYColision(mouseX, mouseY);
    if( n == null){ 
      //ajouter le noued to the graph
      graph.add(new noeud(k++, mouseX, mouseY));
    }
  } else {
    noeud n = graph.XYColision(mouseX, mouseY);
    if( n != null){
      n1 = n;
    }
  }  
}
void mouseReleased() {
  if (mouseButton == RIGHT) {
    noeud n = graph.XYColision(mouseX, mouseY);
    if(n != null){
      n2 = n;
      graph.arretes(n1, n2);
    }
  }
  n1 = null;
  n2 = null;
}
/*________________________________*définition de graph et le test de colision __________________________________________*/


class Graph { 
  //liste contient les noueds
  ArrayList<noeud> list = new ArrayList<noeud>(); 
 
  //ajouter le noued to liste
   public void add(noeud noeud){
    this.list.add(noeud);
  }
  public void arretes(noeud n1, noeud n2){
    n1.addNeighbor(n2);
    n2.addNeighbor(n1);
  }
//le teste de colision   
  //la collision 
  public noeud XYColision(int x, int y){
    for(noeud n : list){
      int dx = n.x - x;
      int dy = n.y - y;
      float dis = sqrt(dx*dx + dy*dy);
      if(dis < n.r*2) return n;
    }
    return null;
  }
  
  }
  
/*---------------------------------------la class des noueds------------------------------------------*/
class noeud{
   int r = 8;
  int id;
  ArrayList<noeud> neighbors = new ArrayList<noeud>();
  int x,y;
  float dv;
  //constructeur de noued 
  noeud(int id, int x, int y){
    this.id = id;
    this.x = x;
    this.y = y;
    this.dv = id;
  }
   //ajouter les voisinage 
  void addNeighbor(noeud n){
    neighbors.add(n);
  }   
  //récupurer le nom de noued 
  public String toString() {
    return "Noeud " + id;  
  }
}
