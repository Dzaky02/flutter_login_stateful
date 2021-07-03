class ValidationMixin {

  // Reuseable email validator
  String? validateEmail(String? value) {
    // return null if valid
    // return string error message if not valid
    if (value != null) {
      if (value.isEmpty) {
        return 'Please enter a your email address';
      } else if (value.isNotEmpty && !value.contains('@')) {
        return 'Please enter a valid email';
      }
    }
  }

  // Reuseable password validator
  String? validatePassword(String? value) {
    // return null if valid
    // return string error message if not valid
    if (value != null && value.length < 4) {
      return 'Password must be at least 4 characters';
    }
  }
}
