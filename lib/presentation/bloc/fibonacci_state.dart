part of 'fibonacci_cubit.dart';

abstract class FibonacciState extends Equatable {
  const FibonacciState();
  @override
  List<Object> get props => [Random().nextInt(9999999)];
}

class FibonacciInitial extends FibonacciState {}

class FibonacciLoading extends FibonacciState {}

class IsFibonacci extends FibonacciState {}

class IsNotFibonacci extends FibonacciState {}

class FibonacciError extends FibonacciState {
  final String errorMessage;

  const FibonacciError(this.errorMessage);
}
