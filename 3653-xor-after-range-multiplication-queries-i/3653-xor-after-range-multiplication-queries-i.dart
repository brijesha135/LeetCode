class Solution {
  int xorAfterQueries(List<int> nums, List<List<int>> queries) {
    int mod = 1000000007;
    for (List<int> q in queries) {
      int l = q[0], r = q[1], k = q[2], v = q[3];
      for (int i = l; i <= r; i += k) {
        nums[i] = (nums[i] * v) % mod;
      }
    }
    int xorSum = 0;
    for (int num in nums) {
      xorSum ^= num;
    }
    return xorSum;
  }
}