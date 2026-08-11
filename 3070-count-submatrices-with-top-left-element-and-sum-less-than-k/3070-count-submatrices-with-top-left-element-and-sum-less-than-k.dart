class Solution {
  int countSubmatrices(List<List<int>> grid, int k) {
    int m = grid.length, n = grid[0].length, count = 0;
    List<List<int>> pref = List.generate(m, (_) => List.filled(n, 0));
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        pref[i][j] = grid[i][j] + (i > 0 ? pref[i-1][j] : 0) + (j > 0 ? pref[i][j-1] : 0) - (i > 0 && j > 0 ? pref[i-1][j-1] : 0);
        if (pref[i][j] <= k) count++;
      }
    }
    return count;
  }
}