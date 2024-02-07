bool isValidEmail(String value) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value);
}

class FormValidator {
  static Function(String) email = (val) {
    if (val.isEmpty) {
      return 'please enter email';
    } else if (!isValidEmail(val)) {
      return 'please enter correct email format';
    } else {
      return '';
    }
  };

  static Function(String) password = (val) {
    if (val.isEmpty) {
      return 'please enter password';
    } else {
      return '';
    }
  };
}
