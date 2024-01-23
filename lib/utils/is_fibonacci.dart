import 'dart:math';

bool isFibonacci(int n) {
  if (n < 0) return false;
  return isPerfectSquare(5 * n * n + 4) || isPerfectSquare(5 * n * n - 4);
}

bool isPerfectSquare(int x) {
  int s = sqrt(x).toInt();
  return (s * s == x);
}
