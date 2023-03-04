class TextFieldValidator {
  emailValidator(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      return null;
    } else {
      return "Enter valid emaiil address.";
    }
  }

  passwordValidator(String password) {
    if (password.isEmpty || password.length < 6) {
      return "Password length must be atleast 6";
    }
    return null;
  }
}
