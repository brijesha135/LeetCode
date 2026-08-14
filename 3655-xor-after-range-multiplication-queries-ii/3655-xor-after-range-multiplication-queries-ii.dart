class Solution {
  int xorAfterQueries(List<int> nums, List<List<int>> queries) {
    int n = nums.length, mod = 1000000007;
    Map<int, List<List<int>>> big = {};
    List<List<int>> small = [];
    
    for (var q in queries) {
      if (q[2] > 300) {
        small.add(q);
      } else {
        big.putIfAbsent(q[2], () => []);
        big[q[2]]!.add(q);
      }
    }
    
    for (var q in small) {
      for (int i = q[0]; i <= q[1]; i += q[2]) {
        nums[i] = nums[i] * q[3] % mod;
      }
    }
    
    for (int k in big.keys) {
      List<int> d = List.filled(n + k + 1, 1);
      for (var q in big[k]!) {
        int l = q[0], r = q[1], v = q[3];
        int last = l + (r - l) ~/ k * k;
        d[l] = d[l] * v % mod;
        d[last + k] = d[last + k] * _inv(v, mod) % mod;
      }
      for (int i = k; i < n; i++) d[i] = d[i] * d[i - k] % mod;
      for (int i = 0; i < n; i++) nums[i] = nums[i] * d[i] % mod;
    }
    
    int xorSum = 0;
    for (int v in nums) xorSum ^= v;
    return xorSum;
  }
  
  int _inv(int a, int m) => _pow(a, m - 2, m);
  int _pow(int a, int e, int m) {
    int r = 1;
    while (e > 0) {
      if (e & 1 == 1) r = r * a % m;
      a = a * a % m;
      e >>= 1;
    }
    return r;
  }
}