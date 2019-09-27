ArrayList<Noeud> Graphe=new ArrayList<Noeud>(6),Graphe_jdid=new ArrayList<Noeud>(6);
ArrayList<Boolean> taken=new ArrayList<Boolean>(6);
ArrayList<pos>Noeuds_pris=new ArrayList<pos>();
ArrayList<Double> distances=new ArrayList<Double>(6), New_distances=new ArrayList<Double>(6);
int ver=1;
boolean fin_dessin=false,commencer=false;
int nb_noeuds=0;

void setup()
{ frameRate(10);
  background(253, 237, 236);
  for(int i=0; i<6; i++)
{  Graphe.add(new Noeud(0,0)); //initialiser tous les noeuds à (0,0)
  
}
  Graphe_jdid=Graphe;
  size(1200,600);
  //ajouter les voisins de chacun
  Graphe.get(0).fils.add(1);   Graphe.get(0).fils.add(2); Graphe.get(0).ordre=0; //v0 (indice0 initialement)
  Graphe.get(5).fils.add(0);   Graphe.get(5).fils.add(2); Graphe.get(5).fils.add(3); Graphe.get(5).ordre=1; //v1(indice 5 initialement)
  Graphe.get(1).fils.add(0);   Graphe.get(1).fils.add(1);   Graphe.get(1).fils.add(4);   Graphe.get(1).fils.add(5);  Graphe.get(1).ordre=2; //v2 (indice1 initialement)
  Graphe.get(4).fils.add(1); Graphe.get(4).ordre=3; //v3 (indice4 initialement)
 Graphe.get(2).fils.add(2); Graphe.get(2).ordre=4; //v4 (indice2 initialement)
 Graphe.get(3).fils.add(2); Graphe.get(3).ordre=5; //v5 (indice3 initialement)



for(int i=0; i<6; i++)
{
  distances.add(new Double(0.0)); taken.add(true); New_distances.add(new Double(-1.0));
}


  
}

int k=1;
void draw()
{ noStroke();
if(mousePressed && nb_noeuds<6)
{ fill(255,0,0);
   int ind=Indice_Ordre(nb_noeuds); 
    print("\n Indice de "+nb_noeuds+"="+ind);
  Dessiner_Noeud(ind,mouseX,mouseY);
}



if( nb_noeuds>6)
{ 

Trier_Tableau();
while(!Equal() && fin_dessin==true && distances.size()!=0 && nb_noeuds>6) 
{     taken=new ArrayList<Boolean>(6);
      for(int i=0; i<6; i++)
{     
   taken.add(true); 
}
  Trier_Tableau();
  print("\n le nouveau Graphe est:de taille"+Graphe.size()+" et ses elements sont \n");
  for(int i=0; i<Graphe.size(); i++)
  print("\n distance de v"+Graphe.get(i).ordre+"="+Graphe.get(i).distance);
 
  }
 // fin_dessin=false;
  if(commencer==true && nb_noeuds>6) 
  {
     
    print("Equal=="+Equal()+" fin_dessin=="+fin_dessin+"size dist="+distances.size());
    Dessiner_Arcs(); commencer=false;
  }
}
 
  

  
}



 


void Trier_Tableau()
{   distances=New_distances;
    New_distances=new ArrayList<Double>(6);

     for(int i=0; i<Graphe.size(); i++)
      {calculer_distance((i)); 
    
      }
         ArrayList<Noeud> Tmp_Graphe=new ArrayList<Noeud>(6);
         java.util.Collections.sort(distances);
         java.util.Collections.sort(New_distances);
         println("\n Tailles new_distances="+New_distances.size()+"\t Taille Graphe="+Graphe.size()+" \t taille taken="+taken.size()+"\tnb_noeuds="+nb_noeuds);
                for(int i=0; i<New_distances.size(); i++)
                {  print("\nDist trié "+i+"="+New_distances.get(i));
                  for(int j=0; j<Graphe.size(); j++)
                  {  
                  print("\ndistance"+j+"="+Graphe.get(j).distance);
               if(Graphe.get(j).distance==New_distances.get(i) && taken.get(j)==true)
               { print("\tle j qui est egale a "+New_distances.get(i)+"est :"+ j);
                 Tmp_Graphe.add(Graphe.get(j)); taken.set(j,false);
                  j=6;
               }
                   
               
             }
         }
         if(Equal()) commencer=true;
         println("\t\t\ttaille de TMP="+Tmp_Graphe.size());
         print("\n\t\tdistance 9dima et jdida equals returns"+Equal());
         for(int i=0; i<distances.size(); i++)
         print("\ndist=="+distances.get(i)+ "  NewDist=="+New_distances.get(i));
        if(Tmp_Graphe.size()!=0)
         Graphe=Tmp_Graphe;
  
     
  
  
}

void Dessiner_Noeud(int nb,int x,int y)
{
  pos pris=new pos(x,y);
  if( Graphe.get(nb).posX==0 && Graphe.get(nb).posY==0 && !Contains(new pos(x,y)))
 {
      ellipse(x,y,30,30);   
     Noeuds_pris.add(pris);
    Noeud prov=new Noeud(); 
      ArrayList<Integer> ami=new ArrayList<Integer>();
      ami=Graphe.get(nb).fils; 
      prov.fils=ami; 
      prov.posX=mouseX; 
      prov.posY=mouseY;
      prov.ordre=Graphe.get(nb).ordre;
     Graphe.set(nb,prov); 
     print("\n nous avons déssiner le Noeud v"+Graphe.get(nb).ordre+" son indice="+nb+" positionX="+Graphe.get(nb).posX+" positionY="+Graphe.get(nb).posY);
     print("\n ses fils sont:\t");
     for(int i=0; i<Graphe.get(nb).fils.size(); i++)
     print("  "+Graphe.get(nb).fils.get(i));
      nb_noeuds++;

  if(nb_noeuds==6) {
    for(int i=0; i<Graphe.size(); i++)
 {         Dessiner_Liens((Indice_Ordre(i))); 
 
 }
 
     for(int i=0; i<Graphe.size(); i++)
 {       textSize(25); fill(0);
                     text(Graphe.get(i).ordre,Graphe.get(Indice_Ordre(Graphe.get(i).ordre)).posX-5,Graphe.get(Indice_Ordre(Graphe.get(i).ordre)).posY+5);

        
    
 }

  nb_noeuds++;
  }
   }
else print("\n cette position est prise!");
}


boolean Contains(pos x)
{
  for(int i=0; i<Noeuds_pris.size(); i++)
  {
    if(Noeuds_pris.get(i).i==x.i && Noeuds_pris.get(i).j==x.j) return true;
  }
  return false;
  
}

void Dessiner_Liens(int nb)
{
 for(int i=0; i<Graphe.get(nb).fils.size(); i++)
 {   strokeWeight(2); stroke(255,0,0);
   line(Graphe.get(nb).posX+5,Graphe.get(nb).posY,Graphe.get(Indice_Ordre(Graphe.get(nb).fils.get(i))).posX+5,Graphe.get(Indice_Ordre(Graphe.get(nb).fils.get(i))).posY);
   
 }
 fin_dessin=true;
  
}

double calculer_distance(int nb)
{
  double distance=Indice_Ordre(Graphe.get(nb).ordre); 
  for(int i=0; i<Graphe.get(nb).fils.size(); i++)
  {
    distance+=Indice_Ordre(Graphe.get(nb).fils.get(i));
    
  }
  distance/=(Graphe.get(nb).fils.size()+1);
  Graphe.get(nb).distance=distance;
  print("\ndistance de v"+Graphe.get(nb).ordre+" ="+distance);
  New_distances.add(distance);
  

  return distance;
}

void Dessiner_Arcs()
{  stroke(0); line(700,500,1150,500); int deb=750; //strokeWeight(1); 
textSize(20);
   for(int k=0; k<Graphe.size(); k++)
   {
     line(deb,495,deb,505); fill(0);
     text("V"+Graphe.get(k).ordre,deb-5,530); 
     noFill(); 
    deb+=60;     
   }
   deb=750;           

  for(int i=0; i<Graphe.size(); i++)
  {  
    
    for(int j=0; j<Graphe.get(i).fils.size(); j++)
    {
      
     int dist=abs(i-Indice_Ordre(Graphe.get(i).fils.get(j))); float centre=(float)((double)(i+Indice_Ordre(Graphe.get(i).fils.get(j)))/2)*60+deb;
       stroke(0); noFill();
          arc(centre,495,dist*60,50*dist,-PI,0);   
          
      }

    //calculer la distance entre les indices avec chaque fils pour dessiner un lien de hauteur (distance)
  }
}
int Indice_Ordre(int ordre)
{
  int ind=0;
  
  for(int i=0; i<Graphe.size(); i++)
  {
    if(Graphe.get(i).ordre==ordre) ind=i;
  }
  
  return ind;
}

boolean Equal()
{
     for(int i=0; i<distances.size(); i++)
     {
       if((double)distances.get(i)!=(double)New_distances.get(i)){ 
        print("on va retourné faux car "+distances.get(i)+" != "+New_distances.get(i));
       return false;  }
     
     }
     
  return true;
}

public class pos{
  int i, j;
  public pos(int x,int y)
  {
   i=x; j=y;
    
  }
  
}



public class Noeud{
  int posX,posY,ordre;
  double distance;
  ArrayList<Integer> fils=new ArrayList<Integer>();
  
  public Noeud(int x,int y){
  posX=x; posY=y;
  fils=new ArrayList<Integer>();
  }
  public Noeud()
  { 
  
  }
  
  
}