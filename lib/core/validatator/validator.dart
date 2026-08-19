String? validateName(String? value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return "Please enter your name";
  } else if (!regExp.hasMatch(value)) {
    return "Name should only contain letters";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your password";
  } else if (value.length < 6) {
    return "Password must be at least 6 characters";
  }
  return null;
}

String? validateMobileNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your mobile number";
  }

  String cleaned = value.replaceAll(RegExp(r'[\s-]'), '');

  String localPattern = r'^01[3-9]\d{8}$';
  String withPlusPattern = r'^\+8801[3-9]\d{8}$';
  String withCodePattern = r'^8801[3-9]\d{8}$';

  bool isValid =
      RegExp(localPattern).hasMatch(cleaned) ||
      RegExp(withPlusPattern).hasMatch(cleaned) ||
      RegExp(withCodePattern).hasMatch(cleaned);

  if (!isValid) {
    return "Please enter a valid Bangladeshi mobile number";
  }

  return null;
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return "Please enter your email address";
  } else if (!regExp.hasMatch(value)) {
    return "Please enter a valid email address";
  }
  return null;
}

String? validateAddress(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your address";
  }
  return null;
}

String? validatePlaceCode(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter the postal code";
  }
  return null;
}

String? validateReason(String? value) {
  if (value == null || value.isEmpty) {
    return "Please provide a reason for this update";
  }
  return null;
}

String? validateThana(String? value) {
  if (value == null || value.isEmpty) {
    return "Please select your thana";
  }
  return null;
}
