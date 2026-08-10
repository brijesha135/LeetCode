class Fancy {
  static const int MOD = 1000000007;
  
  List<int> values = [];
  int mult = 1;
  int add = 0;
  
  // Precompute modular inverses for numbers up to 100
  List<int> invCache = List.filled(101, 0);
  
  Fancy() {
    for (int i = 1; i <= 100; i++) {
      invCache[i] = _modPow(i, MOD - 2);
    }
  }
  
  int _modPow(int base, int exp) {
    int result = 1;
    while (exp > 0) {
      if (exp % 2 == 1) {
        result = (result * base) % MOD;
      }
      base = (base * base) % MOD;
      exp ~/= 2;
    }
    return result;
  }
  
  void append(int val) {
    // When appending, we store the value in a normalized form
    // such that when we apply mult and add, we get the original val
    // stored = (val - add) / mult
    int adjusted = ((val - add) % MOD + MOD) % MOD;
    // Use cached inverse if mult <= 100
    int invMult;
    if (mult <= 100) {
      invMult = invCache[mult];
    } else {
      invMult = _modPow(mult, MOD - 2);
    }
    adjusted = (adjusted * invMult) % MOD;
    values.add(adjusted);
  }
  
  void addAll(int inc) {
    add = (add + inc) % MOD;
  }
  
  void multAll(int m) {
    mult = (mult * m) % MOD;
    add = (add * m) % MOD;
  }
  
  int getIndex(int idx) {
    if (idx >= values.length) return -1;
    // actual = (stored * mult + add) % MOD
    int result = (values[idx] * mult) % MOD;
    result = (result + add) % MOD;
    return result;
  }
}