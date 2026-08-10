class Solution {
  List<int> getBiggestThree(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    Set<int> sums = <int>{};
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        sums.add(grid[i][j]);
        
        for (int k = 1; i - k >= 0 && i + k < m && j - k >= 0 && j + k < n; k++) {
          int sum = 0;
          
          sum += grid[i - k][j];
          
          for (int step = 1; step < k; step++) {
            sum += grid[i - k + step][j + step];
          }
          
          sum += grid[i][j + k];
          
          for (int step = 1; step < k; step++) {
            sum += grid[i + step][j + k - step];
          }
          
          sum += grid[i + k][j];
          
          for (int step = 1; step < k; step++) {
            sum += grid[i + k - step][j - step];
          }
          
          sum += grid[i][j - k];
          
          for (int step = 1; step < k; step++) {
            sum += grid[i - step][j - k + step];
          }
          
          sums.add(sum);
        }
      }
    }
    
    List<int> sorted = sums.toList()..sort((a, b) => b.compareTo(a));
    return sorted.length <= 3 ? sorted : sorted.sublist(0, 3);
  }
}