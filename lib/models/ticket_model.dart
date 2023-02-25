class TicketModel {
  final String subject, description, statusID, createdAt, contactID;
  String? priority, dueDate;
  static List<TicketModel> tickets = [];

  TicketModel({
    required this.subject,
    required this.description,
    required this.statusID,
    this.priority,
    this.dueDate,
    required this.createdAt,
    required this.contactID,
  });
  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      subject: map['subject'],
      description: map['description'],
      statusID: map['statusID'],
      priority: map['priority'],
      dueDate: map['dueDate'],
      createdAt: map['createdAt'],
      contactID: map['contactID'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'description': description,
      'statusID': statusID,
      if (priority != null) 'priority': priority,
      if (dueDate != null) 'dueDate': dueDate,
      'createdAt': createdAt,
      'contactID': contactID,
    };
  }
}
