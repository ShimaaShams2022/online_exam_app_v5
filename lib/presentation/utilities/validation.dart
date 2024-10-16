String? validateEmail(String? value) {
  final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  } else if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  } else if (value.length < 8) {
    return 'Password must be at least 6 characters';
  }
  bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
  bool hasLowercase = value.contains(RegExp(r'[a-z]'));
  bool hasDigits = value.contains(RegExp(r'[0-9]'));
  bool hasSpecialCharacters = value.contains(RegExp(r'[@$!%*?&]'));

  if (!hasUppercase || !hasLowercase || !hasDigits || !hasSpecialCharacters) {
    return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character';
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


String? validatePhone(String? value) {
  final RegExp phoneRegex = RegExp(r'^01[0125][0-9]{8}$');
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  } else if (!phoneRegex.hasMatch(value)) {
    return 'Please enter a valid phone number';
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

String? validateNumber(String? number) {
  if(number==null||number.isNotEmpty){
 return ("enter valid OTP");
  }
  else if(number.length!=2){
    return ("enter valid OTP");
  }
  return null;
}

