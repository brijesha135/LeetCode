class Solution {
  int numberOfSpecialChars(String word) {
    List<int> lastLower = List.filled(26, -1);
    List<int> firstUpper = List.filled(26, -1);
    
    for (int i = 0; i < word.length; i++) {
      int code = word.codeUnitAt(i);
      if (code >= 97) {
        lastLower[code - 97] = i;
      } else {
        if (firstUpper[code - 65] == -1) {
          firstUpper[code - 65] = i;
        }
      }
    }
    
    int count = 0;
    for (int i = 0; i < 26; i++) {
      if (lastLower[i] != -1 && firstUpper[i] != -1 && lastLower[i] < firstUpper[i]) {
        count++;
      }
    }
    return count;
  }
}