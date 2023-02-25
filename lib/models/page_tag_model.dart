class PageTagModel {
  final String id, name, color;
  final bool isActive;
  static List<PageTagModel> tags = [];

  PageTagModel({
    required this.id,
    required this.name,
    required this.color,
    required this.isActive,
  });

  factory PageTagModel.fromMap(Map<String, dynamic> map) {
    return PageTagModel(id: map['id'], name: map['name'], color: map['color'], isActive: map['isActive']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
      'isActive': isActive,
    };
  }
}
