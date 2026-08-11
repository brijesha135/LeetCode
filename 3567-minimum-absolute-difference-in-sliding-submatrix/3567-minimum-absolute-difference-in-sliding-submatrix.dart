class Solution {
  List<List<int>> minAbsDiff(List<List<int>> grid, int k) {
    int m = grid.length, n = grid[0].length;
    List<List<int>> ans = List.generate(m - k + 1, (_) => List.filled(n - k + 1, 0));
    
    for (int i = 0; i <= m - k; i++) {
      for (int j = 0; j <= n - k; j++) {
        Set<int> vals = {};
        for (int x = i; x < i + k; x++) {
          for (int y = j; y < j + k; y++) {
            vals.add(grid[x][y]);
          }
        }
        List<int> sorted = vals.toList()..sort();
        int min = 1 << 30;
        for (int p = 1; p < sorted.length; p++) {
          min = min < sorted[p] - sorted[p-1] ? min : sorted[p] - sorted[p-1];
        }
        ans[i][j] = sorted.length < 2 ? 0 : min;
      }
    }
    return ans;
  }
}