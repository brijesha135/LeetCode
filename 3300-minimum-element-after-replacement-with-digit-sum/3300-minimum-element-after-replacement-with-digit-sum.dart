class Solution {
  int minElement(List<int> nums) => nums.map((n) => n.toString().split('').map(int.parse).reduce((a,b)=>a+b)).reduce((a,b)=>a<b?a:b);
}