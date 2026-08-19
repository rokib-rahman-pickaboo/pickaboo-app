bool isSilentCartError(String message) {
  final m = message.toLowerCase();
  return m.contains('no such entity') ||
      m.contains('customerid') ||
      m.contains('404');
}
