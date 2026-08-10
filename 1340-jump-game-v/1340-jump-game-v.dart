class Solution {
  int maxJumps(List<int> arr, int d) {
    List<int> memo = List.filled(arr.length, 0);
    
    int dfs(i) {
      if (memo[i] > 0) return memo[i];
      int best = 1;
      for (int j = i - 1; j >= i - d && j >= 0 && arr[j] < arr[i]; j--) 
        best = best > dfs(j) + 1 ? best : dfs(j) + 1;
      for (int j = i + 1; j <= i + d && j < arr.length && arr[j] < arr[i]; j++) 
        best = best > dfs(j) + 1 ? best : dfs(j) + 1;
      return memo[i] = best;
    }
    
    return arr.asMap().keys.fold(0, (a, i) => a > dfs(i) ? a : dfs(i));
  }
}