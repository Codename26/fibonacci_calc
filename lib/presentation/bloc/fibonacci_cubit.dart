import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fibonacci_calc/utils/is_fibonacci.dart';
import 'package:flutter/foundation.dart';

part 'fibonacci_state.dart';

class FibonacciCubit extends Cubit<FibonacciState> {
  FibonacciCubit() : super(FibonacciInitial());

  Future<void> calculateFibonacci(int number) async {
    emit(FibonacciLoading());
    try {
      final result = await _checkIfFibonacci(number);
      if (result) {
        emit(IsFibonacci());
      } else {
        emit(IsNotFibonacci());
      }
    } catch (e) {
      emit(FibonacciError(e.toString()));
    }
  }

  Future<bool> _checkIfFibonacci(int number) async {
    return await compute(isFibonacci, number);
  }
}
