extension StringParser on String {
  String getFileType() => split('/').last.split('.').last;

  String getFileName() => split('/').last.split('.').first;
}
