import 'package:fibonacci_calc/presentation/bloc/fibonacci_cubit.dart';
import 'package:fibonacci_calc/presentation/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FibonacciButton extends StatelessWidget {
  const FibonacciButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController valueInputController,
  })  : _formKey = formKey,
        _valueInputController = valueInputController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _valueInputController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            BlocProvider.of<FibonacciCubit>(context)
                .calculateFibonacci(int.parse(_valueInputController.text));
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Is Fibonacci number?',
            style: text20BoldWhite,
          ),
        ));
  }
}
