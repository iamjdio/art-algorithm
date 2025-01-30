float sunRadius = 50;  // rayon du soleil
float[] planetRadii = {100, 150, 200, 250, 300};  // Rayons orbitaux des planètes
float[] planetSpeeds = {0.01, 0.008, 0.006, 0.004, 0.003};  // vitesse orbitale des planets
float[] planetSizes = {10, 15, 20, 17, 30};  // taille des planetes
float[] angles = {0, 1.2, 2.5, 3.8, 5.0};  // angle initial
color[] planetColors = {color(200, 200, 255), color(255, 200, 0), color(150, 150, 255), color(255, 100, 100), color(255, 255, 0)};  // couleur

void setup() {
  size(800,800);
  noStroke();
  //blendMode(ADD);
  //frameRate(3);
}

void draw() {
  background(0); 

  float i = 1;
  float dist = 40;
  while ( i < 60) {
  i += 1;
  //println(i);
  float j = 1;
  while (j < 60) {
    //print(j + " ");
    j += 1;
    float posX = i * dist;
    float posY = j * dist;    

    float col = 255;
    float Sz = random(2);
    fill(col, col, col);
    ellipse(random(posX), random(posY), Sz, Sz);
    
  }
}
  
  translate(width / 2, height / 2);

  // Dessine le soleil au centre
  fill(255, 204, 0);  
  ellipse(0, 0, sunRadius * 2, sunRadius * 2);
  
  // boucle pour dessiner chaque plqnete
  for (int k = 0; k < planetRadii.length; k++) {
    float x = planetRadii[k] * cos(angles[k]); 
    float y = planetRadii[k] * sin(angles[k]); 
    
    fill(planetColors[k]); 
    ellipse(x, y, planetSizes[k], planetSizes[k]); 
    
    // deplacement via l'augmentation de l'angle par la vitesse
    angles[k] += planetSpeeds[k];
  }
  
}
//save("img.png");
