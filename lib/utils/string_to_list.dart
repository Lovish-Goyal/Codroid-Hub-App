extension StringToListExtension on String {
  List<String> toList() {
    return split('.').map((value) => value.trim()).toList();
  }
}
