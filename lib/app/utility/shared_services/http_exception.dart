class ThrowHttpException implements Exception {
  final String? message;
  ThrowHttpException(this.message);

  @override
  String toString() {
    return message!;
  }
}
