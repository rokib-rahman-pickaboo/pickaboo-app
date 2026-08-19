enum Key {
  token("TOKEN"),
  userName("USER_NAME"),
  email("EMAIL"),
  userId("USER_ID"),
  guestSessionId("GUEST_SESSION_ID"),
  guestCartId("GUEST_CART_ID"),
  authQuoteId("AUTH_QUOTE_ID");

  final String keyValue;

  const Key(this.keyValue);
}
