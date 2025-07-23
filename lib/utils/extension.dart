extension StringExtension on String {
  String removeSpecialCharacters() {
    return this.replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  String removeSpecialCharactersAndSpaces() {
    return this.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
  }

  String removeHtmlTags() {
    // Use regular expression to remove HTML tags
    return replaceAll(RegExp(r'<[^>]*>'), '');
  }
}
