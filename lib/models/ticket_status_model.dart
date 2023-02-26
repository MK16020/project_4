class TicketStatusModel {
  final String id, name, color;

  static List<TicketStatusModel> statuses = [];

  TicketStatusModel({
    required this.id,
    required this.name,
    required this.color,
  });

  static TicketStatusModel getStatusFromID(String statusID) {
    TicketStatusModel status = TicketStatusModel(id: 'o', name: 'open', color: 'red');
    for (final stat in statuses) {
      if (stat.id == statusID) {
        status = stat;
      }
    }
    return status;
  }

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
