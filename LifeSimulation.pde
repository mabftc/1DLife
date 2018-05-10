import java.util.Random;

boolean[][] grid;
boolean[] test = {false, false, false, true, true, true, true, false};
int globalTime = 0;

void setup() {
  size(500, 500);
  grid = new boolean[500][500];
  // Uncomment to randomly generate rules
  /*test = new boolean[8];
  Random random = new Random();
  for (int i = 0; i < 8; i++) {
    test[i] = random.nextBoolean();
    print(test[i] + ", ");
  }*/
  
  grid[0][grid[0].length / 2] = true;
  drawGrid();
}

void draw() {
  drawGrid();
  if (mousePressed && globalTime < 499)
    nextState();
}

void drawGrid() {
  for (int time = 0; time < 500; time++) {
    for (int col = 0; col < 500; col++) {
      if (grid[time][col] == true) {
        int a = (int)map(time, 0, 500, 0, 255);
        fill(0, 0, a);
        stroke(0, 0, a);
        rect(col, time, 1, 1);
      }
    }
  }
}

void nextState() {
  for (int col = 1; col < 499; col++) {
    if (grid[globalTime][col - 1] == true && grid[globalTime][col] == true && grid[globalTime][col + 1] == true) grid[globalTime + 1][col] = test[0];
    else if (grid[globalTime][col - 1] == true && grid[globalTime][col] == true && grid[globalTime][col + 1] == false) grid[globalTime + 1][col] = test[1];
    else if (grid[globalTime][col - 1] == true && grid[globalTime][col] == false && grid[globalTime][col + 1] == true) grid[globalTime + 1][col] = test[2];
    else if (grid[globalTime][col - 1] == true && grid[globalTime][col] == false && grid[globalTime][col + 1] == false) grid[globalTime + 1][col] = test[3];
    else if (grid[globalTime][col - 1] == false && grid[globalTime][col] == true && grid[globalTime][col + 1] == true) grid[globalTime + 1][col] = test[4];
    else if (grid[globalTime][col - 1] == false && grid[globalTime][col] == true && grid[globalTime][col + 1] == false) grid[globalTime + 1][col] = test[5];
    else if (grid[globalTime][col - 1] == false && grid[globalTime][col] == false && grid[globalTime][col + 1] == true) grid[globalTime + 1][col] = test[6];
    else grid[globalTime + 1][col] = test[7];
  }
  globalTime++;
}
