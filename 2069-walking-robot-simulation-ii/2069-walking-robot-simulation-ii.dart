class Robot {
  int x = 0, y = 0, dir = 0;
  int w, h;
  int perimeter = 0;
  List<String> dirs = ["East", "North", "West", "South"];
  List<int> dx = [1, 0, -1, 0];
  List<int> dy = [0, 1, 0, -1];
  bool moved = false;

  Robot(this.w, this.h) {
    perimeter = 2 * (w + h) - 4;
  }

  void step(int num) {
    moved = true;
    num = num % perimeter;
    if (num == 0) num = perimeter;
    
    for (int i = 0; i < num; i++) {
      int nx = x + dx[dir];
      int ny = y + dy[dir];
      
      if (nx < 0 || nx >= w || ny < 0 || ny >= h) {
        dir = (dir + 1) % 4;
        i--;
      } else {
        x = nx;
        y = ny;
      }
    }
  }

  List<int> getPos() {
    return [x, y];
  }

  String getDir() {
    if (!moved && x == 0 && y == 0) return "East";
    return dirs[dir];
  }
}