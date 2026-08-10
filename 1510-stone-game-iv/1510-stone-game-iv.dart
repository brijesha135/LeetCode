class Solution {
  bool winnerSquareGame(int n) {
    List<bool> dp = List.filled(n + 1, false);
    
    for (int i = 1; i <= n; i++) {
      for (int k = 1; k * k <= i; k++) {
        int sq = k * k;
        if (!dp[i - sq]) {
          dp[i] = true;
          break;
        }
      }
    }
    
    return dp[n];
  }
}