extension ExtString on String {
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegex = RegExp(
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*[#?!@$%^&*-]).{8,}$",
    );
    return passwordRegex.hasMatch(this);
  }

  bool get isValidPhoneNumber {
    final phoneRegex = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegex.hasMatch(this);
  }
}
