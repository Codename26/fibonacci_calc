import 'dart:math';

///The isFibonacci(int n) function takes an integer n as an argument and checks
///if it's a Fibonacci number. It first checks if n is less than 0, and if so,
///it returns false because Fibonacci numbers are not negative. The function
///then checks if 5 * n * n + 4 or 5 * n * n - 4 is a perfect square. If either
///of these expressions is a perfect square, the function returns true,
///indicating that n is a Fibonacci number. This is based on the mathematical
///property that a number is a Fibonacci number if and only if 5 * n * n + 4 or
///5 * n * n - 4 is a perfect square.

bool isFibonacci(int n) {
  if (n < 0) return false;
  return isPerfectSquare(5 * n * n + 4) || isPerfectSquare(5 * n * n - 4);
}

bool isPerfectSquare(int x) {
  int s = sqrt(x).toInt();
  return (s * s == x);
}
