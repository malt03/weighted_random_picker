int countLengthNotZeros(int n) {
  for (var i = 0; i <= 32; i++) {
    if (n == 0) return i;
    n >>= 1;
  }
  throw 'too large number';
}
