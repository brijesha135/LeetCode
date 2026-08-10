class Solution {
  int numberOfSpecialChars(String word) {
    Set<String> lower = {};
    Set<String> upper = {};
    
    for (String c in word.split('')) {
      if (c.toLowerCase() == c) lower.add(c);
      else upper.add(c.toLowerCase());
    }
    
    return lower.intersection(upper).length;
  }
}