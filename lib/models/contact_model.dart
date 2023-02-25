class ContactModel {
  final String id, name, email, imageUrl, phone, salutation;

  static List<ContactModel> statuses = [
    ContactModel(
        id: '1',
        name: 'maryam',
        email: 'email@mail.com',
        imageUrl: 'assets/images/logo.png',
        phone: '0538472649',
        salutation: 'Mrs'),
  ];

  ContactModel({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.phone,
    required this.salutation,
  });

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      imageUrl: map['imageUrl'],
      phone: map['phone'],
      salutation: map['salutation'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'phone': phone,
      'salutation': salutation,
    };
  }
}
