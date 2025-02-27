//coordonnees dynamiques
float x = random(5,10);
float y = random(5,10);
float z = random(5,10);
//parametre du systeme de Lorenz
float a = 10; //paramètre de Prandtl
float b = 28; //nombre de Rayleigh
float c = 8.0/3.0; //facteur géométrique
float dt = 0.01; //pas dans le temps
float scale = 8; //facteur d'agrandissement de la visualisation

ArrayList<PVector> points; //stockage des points dans une liste sous forme d'objet

void setup(){
  size(800,700,P3D);
  points = new ArrayList<PVector>(); //initialisation de liste pour stocker les points de la trajectoire
  colorMode(HSB,360,100,100);
}

void draw(){
  background(0);
  
  //float nX = noise(frameCount * 0.01) * 2 - 1;
  //float nY = noise(frameCount * 0.01 + 1000) * 2 - 1;
  //float nZ = noise(frameCount * 0.01 + 2000) * 2 - 1;
  
  //float newx = x + dt * (a * (y - x)) + 0.2 * nX;
  //float newy = y + dt * (x * (b - z) - y) + 0.2 * nY;
  //float newz = z + dt * (x * y - c * z) + 0.2 * nZ;
  
  float newx = x + dt*(a*(y-x));
  float newy = y + dt*(x*(b-z)-y);
  float newz = z + dt*(x*y-c-z);
  
  PVector temp = new PVector(newx,newy,newz); //creation de nouveau vecteur
  temp.mult(scale); //agrandissement du vecteur pour visualisation
  points.add(temp); //ajout a la liste les points de la trajectoire
  
  pushMatrix();
    translate(width*0.5,height*0.7);
    //faire pivoter pour avoir la forme papillon
    rotateX(0.5*PI);
    //faire tourner pour animation fluide
    //float angleZ = noise(frameCount * 0.01) * PI;
    rotateZ(frameCount*0.01);
    //rotateZ(angleZ);
    float col = 0;
    //float col2 = noise(frameCount * 0.01) * 360;
    //scale(3);
    //boucle pour s'arreter avant l'avant dernier point
    for(int i = 0; i < points.size()-1; i++){
      PVector p1 = points.get(i);
      PVector p2 = points.get(i+1);
      stroke(col,100,100);
      //point(p1.x,p1.y,p1.z);
      //point(p2.x,p2.y,p2.z);
      line(p1.x,p1.y,p1.z, p2.x,p2.y,p2.z);
      
      //creer le rendu e variation de couleur
      col += 0.1;
      if (col > 360){
        col = 0;
      }
    }
    
    //avoir un suivi sur le deplacement grace au dernier point enregistre
    pushMatrix();
      PVector end = points.get(points.size()-1);
      translate(end.x, end.y, end.z);
      fill(col,100,100);
      sphere(3);
    popMatrix();
  popMatrix();
  
  
  
  x = newx;
  y = newy;
  z = newz;
}
