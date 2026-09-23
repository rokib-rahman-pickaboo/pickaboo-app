class TicketIssueTypeModel {
  final String id;
  final String name;

  const TicketIssueTypeModel({
    required this.id,
    required this.name,
  });

  factory TicketIssueTypeModel.fromJson(Map<String, dynamic> json) {
    final id = json['department_id']?.toString() ??
        json['id']?.toString() ??
        json['issue_id']?.toString() ??
        json['issue_type_id']?.toString() ??
        json['value']?.toString() ??
        '';
    final name = json['name']?.toString() ??
        json['title']?.toString() ??
        json['label']?.toString() ??
        json['department_name']?.toString() ??
        json['issue_type']?.toString() ??
        '';
    return TicketIssueTypeModel(
      id: id.isNotEmpty ? id : name,
      name: name.isNotEmpty ? name : id,
    );
  }

  Map<String, dynamic> toJson() => {
    'department_id': id,
    'name': name,
  };
}
