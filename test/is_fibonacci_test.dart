import 'package:fibonacci_calc/utils/is_fibonacci.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('isFibonacci returns true for Fibonacci numbers', () async {
    expect(await compute(isFibonacci, 0), true);
    expect(await compute(isFibonacci, 1), true);
    expect(await compute(isFibonacci, 2), true);
    expect(await compute(isFibonacci, 3), true);
    expect(await compute(isFibonacci, 5), true);
    expect(await compute(isFibonacci, 8), true);
    expect(await compute(isFibonacci, 13), true);
  });

  test('isFibonacci returns false for non-Fibonacci numbers', () async {
    expect(await compute(isFibonacci, 4), false);
    expect(await compute(isFibonacci, 6), false);
    expect(await compute(isFibonacci, 7), false);
    expect(await compute(isFibonacci, 9), false);
    expect(await compute(isFibonacci, 10), false);
  });

  test('isFibonacci handles edge cases', () async {
    expect(await compute(isFibonacci, -1), false);
    expect(await compute(isFibonacci, 701408733), true);
    expect(await compute(isFibonacci, 701408734), false);
    expect(await compute(isFibonacci, -701408734), false);
    expect(await compute(isFibonacci, 132567567657567), false);
  });
}
