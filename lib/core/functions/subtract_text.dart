subtractText(String? text) {
  int maxLength = 20;
  return (text == null)
      ? ""
      : text.length > maxLength
          ? "${text.substring(0, maxLength)}..."
          : text;
}
