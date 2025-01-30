float sunRadius = 50;  // Radius of the Sun
float[] planetRadii = {100, 150, 200, 250, 300};  // Orbital radii of planets
float[] planetSpeeds = {0.01, 0.008, 0.006, 0.004, 0.003};  // Orbital speeds of planets
float[] planetSizes = {10, 15, 20, 18, 12};  // Sizes of the planets
float[] angles = {0, 1.2, 2.5, 3.8, 5.0};  // Initial angles of the planets
color[] planetColors = {color(200, 200, 255), color(255, 200, 0), color(150, 150, 255), color(255, 100, 100), color(255, 255, 0)};  // Colors of the planets

void setup() {
  size(screenWidth, screenHeight);
  noStroke();
}

void draw() {
  background(0);  // Black background representing space
  translate(width / 2, height / 2);  // Move the origin to the center of the screen

  // Draw the Sun at the center
  fill(255, 204, 0);  // Yellow color for the Sun
  ellipse(0, 0, sunRadius * 2, sunRadius * 2);
  
  // Loop through each planet and draw them
  for (int i = 0; i < planetRadii.length; i++) {
    float x = planetRadii[i] * cos(angles[i]);  // X position based on angle and radius
    float y = planetRadii[i] * sin(angles[i]);  // Y position based on angle and radius
    
    fill(planetColors[i]);  // Set the planet color
    ellipse(x, y, planetSizes[i], planetSizes[i]);  // Draw the planet
    
    // Update the angle to simulate the orbit
    angles[i] += planetSpeeds[i];  // Increase the angle for the next frame
  }
}
