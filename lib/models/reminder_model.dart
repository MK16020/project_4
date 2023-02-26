class ReminderModel {
  final String id, title, description, contactID;
  final int dueDate, createdAt;
  static List<ReminderModel> reminders = [];

  ReminderModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.createdAt,
    required this.contactID,
  });

  factory ReminderModel.fromMap(Map<String, dynamic> map) {
    return ReminderModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dueDate: map['dueDate'],
      createdAt: map['createdAt'],
      contactID: map['contactID'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'createdAt': createdAt,
      'contactID': contactID,
    };
  }
}
