import 'package:fibonacci_calc/presentation/bloc/fibonacci_cubit.dart';
import 'package:fibonacci_calc/presentation/screen/main/widget/fibonacci_form.dart';
import 'package:fibonacci_calc/presentation/theme/text_style.dart';
import 'package:fibonacci_calc/utils/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FibonacciCubit(),
      child: MainView(title: title),
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FibonacciCubit, FibonacciState>(
      listener: (context, state) {
        if (state is FibonacciError) {
          showMessage(context, state.errorMessage, isError: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(child: Text(title)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              const FibonacciForm(),
              Container(
                height: 1,
                width: double.infinity,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                height: 32,
              ),
              BlocBuilder<FibonacciCubit, FibonacciState>(
                builder: (context, state) {
                  if (state is IsFibonacci) {
                    return const Text(
                      'The input is a Fibonacci number',
                      style: text20Bold,
                    );
                  } else if (state is IsNotFibonacci) {
                    return const Text(
                      'The input is not a Fibonacci number',
                      style: text20Bold,
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
