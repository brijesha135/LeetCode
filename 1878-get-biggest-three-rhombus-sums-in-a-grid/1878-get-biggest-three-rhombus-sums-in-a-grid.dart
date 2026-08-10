class Solution {
  List<int> getBiggestThree(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    Set<int> sums = {};

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        sums.add(grid[i][j]);

        for (int k = 1; i + 2 * k < m && j + k < n && j - k >= 0; k++) {
          int sum = 0;
          for (int step = 0; step <= k; step++) {
            sum += grid[i + step][j - step];
            sum += grid[i + step][j + step];
            sum += grid[i + 2 * k - step][j - step];
            sum += grid[i + 2 * k - step][j + step];
          }
          sum -= grid[i][j];
          sum -= grid[i + 2 * k][j];
          sum -= grid[i + k][j - k];
          sum -= grid[i + k][j + k];
          sums.add(sum);
        }
      }
    }

    List<int> sorted = sums.toList()..sort((a, b) => b.compareTo(a));
    return sorted.length <= 3 ? sorted : sorted.sublist(0, 3);
  }
}