String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'This Email is not valid';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your full name';
  } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
    return 'Full name can only contain letters and spaces';
  } else if (value.split(' ').length < 2) {
    return 'Please enter at least a first and last name';
  }
  return null;
}
String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your username';
  } else if (value.length < 4) {
    return 'Username must be at least 4 characters';
  } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
    return 'Username can only contain letters, numbers, and underscores';
  }
  return null;
}

String? validateEgyptianPhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  } else if (!RegExp(r'^01[0125]\d{8}$').hasMatch(value)) {
    return 'Phone number must be 11 digits and start with 010, 011, 012, or 015';
  }
  return null;
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Please confirm your password';
  } else if (password != confirmPassword) {
    return 'Passwords do not match';
  }
  return null;
}