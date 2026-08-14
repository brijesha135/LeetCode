class Solution {
  int maximumLengthSubstring(String s) {
    int max = 0, left = 0;
    Map<String, int> freq = {};
    
    for (int right = 0; right < s.length; right++) {
      String ch = s[right];
      freq[ch] = (freq[ch] ?? 0) + 1;
      
      while (freq[ch]! > 2) {
        String leftChar = s[left];
        freq[leftChar] = freq[leftChar]! - 1;
        left++;
      }
      
      max = max > right - left + 1 ? max : right - left + 1;
    }
    
    return max;
  }
}