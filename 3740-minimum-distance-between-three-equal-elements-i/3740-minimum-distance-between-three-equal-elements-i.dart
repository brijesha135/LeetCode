class Solution {
  int minimumDistance(List<int> nums) {
    Map<int, List<int>> pos = {};
    for (int i = 0; i < nums.length; i++) {
      pos.putIfAbsent(nums[i], () => []);
      pos[nums[i]]!.add(i);
    }
    
    int minDist = -1;
    for (var list in pos.values) {
      if (list.length < 3) continue;
      for (int i = 0; i <= list.length - 3; i++) {
        int a = list[i], b = list[i + 1], c = list[i + 2];
        int dist = (a - b).abs() + (b - c).abs() + (c - a).abs();
        if (minDist == -1 || dist < minDist) minDist = dist;
      }
    }
    return minDist;
  }
}