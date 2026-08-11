class Solution {
  int numberOfSubmatrices(List<List<String>> grid) {
    int m = grid.length, n = grid[0].length, count = 0;
    List<List<int>> xPref = List.generate(m, (_) => List.filled(n, 0));
    List<List<int>> yPref = List.generate(m, (_) => List.filled(n, 0));
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        int x = grid[i][j] == 'X' ? 1 : 0;
        int y = grid[i][j] == 'Y' ? 1 : 0;
        xPref[i][j] = x + (i > 0 ? xPref[i-1][j] : 0) + (j > 0 ? xPref[i][j-1] : 0) - (i > 0 && j > 0 ? xPref[i-1][j-1] : 0);
        yPref[i][j] = y + (i > 0 ? yPref[i-1][j] : 0) + (j > 0 ? yPref[i][j-1] : 0) - (i > 0 && j > 0 ? yPref[i-1][j-1] : 0);
        if (xPref[i][j] > 0 && xPref[i][j] == yPref[i][j]) count++;
      }
    }
    return count;
  }
}