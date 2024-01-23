import 'package:fibonacci_calc/presentation/bloc/fibonacci_cubit.dart';
import 'package:fibonacci_calc/presentation/screen/main/widget/fibonacci_button.dart';
import 'package:fibonacci_calc/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FibonacciForm extends StatefulWidget {
  const FibonacciForm({super.key});

  @override
  FibonacciFormState createState() {
    return FibonacciFormState();
  }
}

class FibonacciFormState extends State<FibonacciForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _valueInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const Text('Enter a number:'),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  controller: _valueInputController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: integerValidator,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: SizedBox(
              height: 55,
              child: BlocBuilder<FibonacciCubit, FibonacciState>(
                builder: (context, state) {
                  if (state is FibonacciLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return FibonacciButton(
                      formKey: _formKey,
                      valueInputController: _valueInputController);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
