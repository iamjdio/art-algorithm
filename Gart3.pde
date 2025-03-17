String sequenceADN = "";
int numBases;
float angle = 0; // Angle pour l'animation
int currentBase = 0; // Indice de la dernière base affichée

int startX = 50;  // Position de départ en X
int startY = 100; // Position de départ en Y
int spacing = 60; // Espace entre chaque paire

void setup() {
  size(1200, 700, P3D); // Fenêtre avec 3D activé
  frameRate(20);
  
  textSize(15);
  
  //Lecture du fichier ADN
  String[] lines = loadStrings("/home/iberic/Documents/IFT6251/sequence.txt");
  if (lines.length > 0) {
    sequenceADN = lines[0].toUpperCase(); // Prend la première ligne du fichier
  }
   numBases = sequenceADN.length();
  
}

void draw() {
  background(0);
  afficherComplementaireADN();

  lights(); // Lumières pour effet 3D
  translate(width / 2, height / 2); // Centrage
  //rotate(45);
  
  //for (int i = 0; i < numBases; i++){
  for (int i = 0; i < currentBase; i++){
    //float y = map(i, 0, currentBase, -300, 300);
    float y = map(i, 0, numBases - 1, -300, 300);
    float xOffset = 45 * cos(angle + i * 0.5); // Effet hélicoïdal
    float xComplement = -xOffset;

    char base = sequenceADN.charAt(i);
    char complement = getComplement(base);

    // Dessiner les bases
    drawBase(base, xOffset, y);
    drawBase(complement, xComplement, y);

    // Relier les bases complémentaires
    stroke(200, 200, random(255));
    strokeWeight(1);
    line(xOffset, y, 0, xComplement, y, 0);
  }

  angle += 0.05; // Incrémentation pour l'animation
  
  // Affichage progressif : une base toutes les 10 frames
  if (currentBase < numBases && frameCount % 10 == 0) {
    currentBase++; // Ajouter une base progressivement
  }
}

void afficherComplementaireADN() {
  for (int i = 0; i < numBases; i++) {
  //for (int i = 0; i < sequenceADN.length(); i++) {
    char base = sequenceADN.charAt(i);
    char complement = getComplement(base);
    
    float yy = map(i, 0, numBases - 1, 20 , height - 10);
    
    // Relier les bases par une ligne
    stroke(200, 200, random(255));
    line(startX , yy, startX + 40, yy);
    
    // Affichage du texte
    fill(255);
    text(base, startX - 30, yy );
    fill(255,0,0);
    text(complement, startX + 60, yy);
  }
}

// Fonction pour obtenir la base complémentaire
char getComplement(char base) {
  switch (base) {
    case 'A': return 'T';
    case 'T': return 'A';
    case 'C': return 'G';
    case 'G': return 'C';
    default: return '?';
  }
}

// Fonction pour dessiner une base avec couleur et forme adaptées
//void drawBase(char base, float x, float y) {
void drawBase(char base, float x, float y) {
  pushMatrix();
  translate(x, y, 0);
  
  noStroke(); // Supprime les bordures noires
  //noLoop();

  // Définir la couleur selon la base
  switch (base) {
    //case 'A': fill(255, 20, 10);sphere(5); break;  // Rouge
    //case 'T': fill(200, 128, 128);sphere(5); break;  // Bleu
    //case 'C': fill(10, 0, 200); box(10);break;  // Vert
    //case 'G': fill(100, 200, 255); box(10);break; // Jaune
    case 'A': fill(128,128,128);sphere(3); break;  // gris
    case 'T': fill(255,255,255);sphere(6); break;  // Blanc
    case 'C': fill(50,100,50); sphere(8);break;  // rose
    case 'G': fill(150, 0, 0); sphere(12);break; // rouge vin
  }

  popMatrix();
}
