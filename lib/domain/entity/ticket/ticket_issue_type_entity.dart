class TicketIssueTypeEntity {
  final String id;
  final String name;

  const TicketIssueTypeEntity({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TicketIssueTypeEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
