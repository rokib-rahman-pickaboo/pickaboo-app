bool isSilentCartError(String message) {
  final m = message.toLowerCase();
  return m.contains('no such entity') ||
      m.contains('customerid') ||
      m.contains('404') ||
      m.contains('not enough items') ||
      m.contains('items for sale') ||
      m.contains('requested qty') ||
      m.contains('quantity') ||
      m.contains('out of stock');
}
