class Solution {
  int missingInteger(List<int> nums) {
    int sum = nums[0];
    for (int i = 1; i < nums.length && nums[i] == nums[i-1] + 1; i++) sum += nums[i];
    Set<int> set = nums.toSet();
    while (set.contains(sum)) sum++;
    return sum;
  }
}