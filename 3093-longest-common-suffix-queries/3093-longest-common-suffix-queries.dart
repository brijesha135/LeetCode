class Solution {
  List<int> stringIndices(List<String> wordsContainer, List<String> wordsQuery) {
    List<Map<String, dynamic>> trie = [{'children': {}, 'idx': -1}];
    int bestIndex = 0;
    
    for (int i = 0; i < wordsContainer.length; i++) {
      String rev = wordsContainer[i].split('').reversed.join();
      int node = 0;
      
      if (trie[node]['idx'] == -1 || wordsContainer[i].length < wordsContainer[trie[node]['idx']].length) {
        trie[node]['idx'] = i;
      }
      
      for (int j = 0; j < rev.length; j++) {
        String ch = rev[j];
        if (!trie[node]['children'].containsKey(ch)) {
          trie[node]['children'][ch] = trie.length;
          trie.add({'children': {}, 'idx': -1});
        }
        node = trie[node]['children'][ch];
        if (trie[node]['idx'] == -1 || wordsContainer[i].length < wordsContainer[trie[node]['idx']].length) {
          trie[node]['idx'] = i;
        }
      }
      
      if (wordsContainer[i].length < wordsContainer[bestIndex].length) {
        bestIndex = i;
      }
    }
    
    List<int> ans = [];
    for (String query in wordsQuery) {
      String rev = query.split('').reversed.join();
      int node = 0;
      int found = -1;
      
      for (int j = 0; j < rev.length; j++) {
        String ch = rev[j];
        if (!trie[node]['children'].containsKey(ch)) break;
        node = trie[node]['children'][ch];
        if (trie[node]['idx'] != -1) {
          found = trie[node]['idx'];
        }
      }
      
      ans.add(found == -1 ? bestIndex : found);
    }
    return ans;
  }
}