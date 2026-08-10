class Solution {
  String getHappyString(int n, int k) {
    String result = "";
    int count = 0;
    
    void backtrack(String current) {
      // If we already found the k-th string, stop
      if (result.isNotEmpty) return;
      
      // If current string length is n, we found a happy string
      if (current.length == n) {
        count++;
        if (count == k) {
          result = current;
        }
        return;
      }
      
      // Try characters in lexicographical order: 'a', 'b', 'c'
      for (String char in ['a', 'b', 'c']) {
        // Skip if same as last character
        if (current.isNotEmpty && current[current.length - 1] == char) {
          continue;
        }
        backtrack(current + char);
        // Early exit if found
        if (result.isNotEmpty) return;
      }
    }
    
    backtrack("");
    return result;
  }
}