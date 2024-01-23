String? integerValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter valid integer';
  } else if (int.tryParse(value) == null) {
    return 'Please enter valid integer';
  }
  return null;
}
