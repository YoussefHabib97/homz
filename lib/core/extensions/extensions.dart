extension StringExtension on String {
  bool get isValidName {
    final nameRegExp = RegExp(
      r"^[a-zA-Z\p{L} ,.'-]*$",
      caseSensitive: false,
      unicode: true,
    );
    return nameRegExp.hasMatch(this);
  }

  String capitalizeEach() {
    if (trim().isEmpty) {
      return '';
    }
    return split(' ')
        .map(
          (element) =>
              "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}",
        )
        .join(" ");
  }
}
