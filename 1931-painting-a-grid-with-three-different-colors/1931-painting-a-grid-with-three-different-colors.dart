class Solution {
  int colorTheGrid(int m, int n) {
    const int MOD = 1000000007;
    
    // 1. Generate all valid colorings for a SINGLE column of height 'm'
    // We represent colors as 1, 2, 3 (Red, Green, Blue)
    List<int> validColumns = [];
    
    // Use a recursive function to generate patterns (Bitmasking/DFS)
    void dfs(int row, int currentMask, int lastColor) {
      if (row == m) {
        validColumns.add(currentMask);
        return;
      }
      
      for (int color = 1; color <= 3; color++) {
        if (color != lastColor) { // Cannot be the same as the cell above
          // Shift current mask to make room for the new color, then add the new color
          int newMask = (currentMask * 10) + color; 
          dfs(row + 1, newMask, color);
        }
      }
    }
    dfs(0, 0, 0); // Start generating
    
    int colCount = validColumns.length;
    
    // 2. Create an adjacency list. 
    // adjacent[i] will store a list of column indices that can be placed NEXT to validColumns[i]
    List<List<int>> adjacent = List.generate(colCount, (_) => []);
    
    for (int i = 0; i < colCount; i++) {
      for (int j = 0; j < colCount; j++) {
        if (i == j) continue; // A column cannot be next to an identical column
        
        bool canPlaceNext = true;
        int mask1 = validColumns[i];
        int mask2 = validColumns[j];
        
        // Check row by row to make sure no horizontal neighbors share a color
        for (int k = 0; k < m; k++) {
          int color1 = mask1 % 10;
          int color2 = mask2 % 10;
          if (color1 == color2) {
            canPlaceNext = false;
            break;
          }
          mask1 ~/= 10;
          mask2 ~/= 10;
        }
        
        if (canPlaceNext) {
          adjacent[i].add(j);
        }
      }
    }
    
    // 3. Dynamic Programming
    // dp[colIndex] = number of ways to form a grid ending with this specific column pattern
    List<int> dp = List.filled(colCount, 1); // Base case: 1 way to paint the first column
    
    // Iterate through the remaining columns (n - 1 times)
    for (int col = 1; col < n; col++) {
      List<int> nextDp = List.filled(colCount, 0);
      
      for (int i = 0; i < colCount; i++) {
        // For each current column pattern 'i', add its ways to all valid neighbors 'j'
        for (int j in adjacent[i]) {
          nextDp[j] = (nextDp[j] + dp[i]) % MOD;
        }
      }
      dp = nextDp; // Move to the next column
    }
    
    // 4. Sum up all the ways for the last column
    int totalWays = 0;
    for (int val in dp) {
      totalWays = (totalWays + val) % MOD;
    }
    
    return totalWays;
  }
}