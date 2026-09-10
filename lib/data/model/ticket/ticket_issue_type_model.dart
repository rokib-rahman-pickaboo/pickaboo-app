class TicketIssueTypeModel {
  final String id;
  final String name;

  const TicketIssueTypeModel({
    required this.id,
    required this.name,
  });

  factory TicketIssueTypeModel.fromJson(Map<String, dynamic> json) {
    return TicketIssueTypeModel(
      id: json['department_id']?.toString() ??
          json['id']?.toString() ??
          '',
      name: json['name']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'department_id': id,
    'name': name,
  };
}
