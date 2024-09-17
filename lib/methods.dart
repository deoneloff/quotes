void log(String message) {
  final timeStamp = DateTime.now().toIso8601String();
  print('[$timeStamp] $message');
}
