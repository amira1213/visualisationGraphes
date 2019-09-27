ArrayList<Noeud> Graphe=new ArrayList<Noeud>(11),Graphe_jdid=new ArrayList<Noeud>(11);
ArrayList<Boolean> taken=new ArrayList<Boolean>();
ArrayList<Double> distances=new ArrayList<Double>(11), New_distances=new ArrayList<Double>(11);
int ver=1;
ArrayList<ArcSouligne> arcsoul=new ArrayList<ArcSouligne>();
boolean fin_dessin=false,commencer=false;
int nb_noeuds=0;

void setup()
{ frameRate(10);
  background(253, 237, 236);
  for(int i=0; i<11; i++)
{  Graphe.add(new Noeud(0,0)); //initialiser tous les noeuds à (0,0)
   taken.add(false);
   print("la taille de taken="+taken.size());
  
}
  Graphe_jdid=Graphe;
  size(1200,800);
  //ajouter les voisins de chacun
  Graphe.get(0).fils.add(new FilsPoids(1,10));  Graphe.get(0).endroit="Bab El Oued";    Graphe.get(0).ordre=0; //v0 (indice0 initialement)
  Graphe.get(1).fils.add(new FilsPoids(7,5));   Graphe.get(1).fils.add(new FilsPoids(2,15)); Graphe.get(1).endroit="3 Horloges";   Graphe.get(1).ordre=1; //v1(indice 5 initialement)
  Graphe.get(2).fils.add(new FilsPoids(3,10));   Graphe.get(2).fils.add(new FilsPoids(7,10)); Graphe.get(2).endroit="El Kettar";    Graphe.get(2).ordre=2; //v2 (indice1 initialement)
  Graphe.get(3).fils.add(new FilsPoids(4,5)); Graphe.get(3).ordre=3; Graphe.get(3).endroit="Climat de france";  //v3 (indice4 initialement)
 Graphe.get(4).fils.add(new FilsPoids(5,5)); Graphe.get(4).ordre=4; Graphe.get(4).endroit="Tagarin"; //v4 (indice2 initialement)
 Graphe.get(5).fils.add(new FilsPoids(6,5)); Graphe.get(5).ordre=5; Graphe.get(5).endroit="La scala"; //v5 (indice3 initialement)
 Graphe.get(6).fils.add(new FilsPoids(8,4)); Graphe.get(6).endroit="El Biar";  Graphe.get(6).fils.add(new FilsPoids(10,10)); Graphe.get(6).ordre=6;
 Graphe.get(7).fils.add(new FilsPoids(8,4)); Graphe.get(7).ordre=7; Graphe.get(7).endroit="Triolet"; 
  Graphe.get(8).fils.add(new FilsPoids(9,5)); Graphe.get(8).ordre=8; Graphe.get(8).endroit="Carnot"; 
 Graphe.get(9).fils.add(new FilsPoids(10,5)); Graphe.get(9).ordre=9; Graphe.get(9).endroit="Armaf"; 
   Graphe.get(5).ordre=10; Graphe.get(10).endroit="Chateauneuf"; 
  
for(int i=0; i<11; i++)
{
  distances.add(new Double(0.0));  New_distances.add(new Double(-1.0));
}
int y=50;
for(int i=0; i<11; i++)
{  fill(0); text(Graphe.get(i).endroit,390,y);
  ellipse(500,y,30,30); Graphe.get(i).posX=500; Graphe.get(i).posY=y;
  fill(255);
  text(i,500-5,y); 
  y+=50;
  
}

for(int i=0; i<Graphe.size(); i++)
{
    DessinerArc();

  
}

Dijkstra(); print("\nnous avons pris les arc");
for(int i=0; i<arcsoul.size(); i++)
  println(" arc ("+arcsoul.get(i).noeuds1+","+arcsoul.get(i).noeuds2+")");
  DessinerDijkstra();
}

int k=1;
void draw()
{ noStroke();





  
}


void Dijkstra()
{
  
  int racine=0, svt=0;
  print("\n\t\t\ttaille de taken="+taken.size());
  while(END()==false)
  { 
     svt=RechercherMin(racine);
    if(racine==svt) break;
      racine=svt;
      
    
    
  }
  
  
  
  
}

int RechercherMin(int noeud)
{  
  int suivant,min;
  if(Graphe.get(noeud).fils.size()!=0)
  {suivant=Graphe.get(noeud).fils.get(0).valeur;  min=Graphe.get(noeud).fils.get(0).poids; }
  else return noeud;
 
  for(int i=1; i<Graphe.get(noeud).fils.size(); i++)
  {
    if(Graphe.get(noeud).fils.get(i).poids<min && taken.get(Graphe.get(noeud).fils.get(i).valeur)==false)
    {
      min=Graphe.get(noeud).fils.get(i).poids;
    suivant=Graphe.get(noeud).fils.get(i).valeur;
    }
    
    
  }
  taken.set(noeud,true);
  ArcSouligne arcPris=new ArcSouligne(noeud,suivant,min);
  arcsoul.add(arcPris);
  return suivant;
}

boolean END()
{ print("taille ="+taken.size());
  for(int i=0; i<11; i++)
  {
    if(taken.get(i)==false ) return false;
    
  }
  return true;
  
  
}

void DessinerDijkstra()
{  int y=50;
  for(int i=0; i<arcsoul.size(); i++)
  {  fill(0);
     ellipse(800,y,30,30); fill(255); text(arcsoul.get(i).noeuds1,800,y); fill(0); text(Graphe.get(arcsoul.get(i).noeuds1).endroit,900,y);
     if(i==arcsoul.size()-1)
     { y+=50; 
      fill(0);
     ellipse(800,y,30,30); fill(255); text(arcsoul.get(i).noeuds2,800,y); fill(0); text(Graphe.get(arcsoul.get(i).noeuds2).endroit,900,y); 
       
     }
    y+=50; 
    
    
  }
  
  int deb=50; int y1=0;
    for(int i=0; i<arcsoul.size(); i++)
  {  
         
    fill(0);
   //print("taille arcsoul="+arcsoul.size());
    text(arcsoul.get(i).dist,750,deb+16);
  line(800,deb+15,800,deb+50-15);
  
     
       deb=deb+50;
       
       stroke(0,0,255); strokeWeight(5);
       int dist=abs(Graphe.get(arcsoul.get(i).noeuds1).posY-(Graphe.get(arcsoul.get(i).noeuds2).posY)); 
     float centre=(float)((double)(Graphe.get(arcsoul.get(i).noeuds1).posY+(Graphe.get(arcsoul.get(i).noeuds2).posY))/2);
          noFill();   arc(500,centre,dist/2,dist,-PI/2,PI/2);  
  }
  
  

}
void DessinerArc()
{
  int deb=0; 
for(int num=0; num<Graphe.size(); num++)
 { for(int i=0; i<Graphe.get(num).fils.size(); i++)
  {
     //print("\ndistancec entre"+num+"et"+(Graphe.get(num).fils.get(i).valeur)+"="+dist);
     int dist=abs(Graphe.get(num).posY-(Graphe.get(Graphe.get(num).fils.get(i).valeur).posY)); 
     float centre=(float)((double)(Graphe.get(num).posY+(Graphe.get(Graphe.get(num).fils.get(i).valeur).posY))/2)+deb;
        noFill();
       print("\t\t\tla distance="+dist+"centre=="+centre); fill(0);  noFill();
       if(Graphe.get(num).fils.get(i).poids<8) stroke(0,255,0); else stroke(255,0,0); 
        arc(500,centre,dist/2,dist,-PI/2,PI/2);  
       
       
       
    
  }
 }
  
  
}






public class Noeud{
  int posX,posY,ordre;
  double distance;
  ArrayList<FilsPoids> fils=new ArrayList<FilsPoids>();
  String endroit;
  public Noeud(int x,int y){
  posX=x; posY=y;
  fils=new ArrayList<FilsPoids>();
  }
  public Noeud()
  { 
  
  }
  
  
}

public class FilsPoids{
  int valeur; 
  int poids;
  public FilsPoids(int v,int p)
  {
    valeur=v; poids=p;
  }
  
}
public class ArcSouligne
{
  int noeuds1,noeuds2,dist;
  public ArcSouligne(int n1, int n2,int d)
  {
    noeuds1=n1;
    noeuds2=n2;
    dist=d;
    
  }
  
  
  
}