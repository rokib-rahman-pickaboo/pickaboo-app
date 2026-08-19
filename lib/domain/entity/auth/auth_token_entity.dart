class AuthTokenEntity {
  final String token;
  final DateTime? expiresAt;

  const AuthTokenEntity({required this.token, this.expiresAt});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthTokenEntity &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          expiresAt == other.expiresAt;

  @override
  int get hashCode => Object.hash(token, expiresAt);

  @override
  String toString() => 'AuthTokenEntity(token: $token, expiresAt: $expiresAt)';
}
