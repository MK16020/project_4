class TicketStatusModel {
  final String id, name, color;

  static List<TicketStatusModel> statuses = [];

  TicketStatusModel({
    required this.id,
    required this.name,
    required this.color,
  });

  factory TicketStatusModel.fromMap(Map<String, dynamic> map) {
    return TicketStatusModel(id: map['id'], name: map['name'], color: map['color']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }
}
