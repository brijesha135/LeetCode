class Solution {
  bool canReach(String s, int minJump, int maxJump) {
    List<bool> dp = List.filled(s.length, false);
    dp[0] = true;
    int prefix = 0;
    
    for (int i = 1; i < s.length; i++) {
      if (i >= minJump) prefix += dp[i - minJump] ? 1 : 0;
      if (i > maxJump) prefix -= dp[i - maxJump - 1] ? 1 : 0;
      dp[i] = s[i] == '0' && prefix > 0;
    }
    
    return dp[s.length - 1];
  }
}