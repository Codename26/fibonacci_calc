///This function is a simple utility for validating if a given string can be
///parsed into a valid integer.

const enterValidInteger = 'Please enter valid integer';

String? integerValidator(String? value) {
  if (value == null || value.isEmpty) {
    return enterValidInteger;
  } else if (int.tryParse(value) == null) {
    return enterValidInteger;
  }
  return null;
}
