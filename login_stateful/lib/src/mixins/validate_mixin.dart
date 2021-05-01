class ValidateMixin {
  String validateEmail(String value) {
    if (!value.contains("@")) {
      return 'Please enter a valid email!';
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return "Password must be at least 4 characters!";
    }
    return null;
  }
}
