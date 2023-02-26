class ContactModel {
  final String id, name, email, imageUrl, phone, salutation;

  static List<ContactModel> contacts = [
    ContactModel(
        id: '0',
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

  static ContactModel getContactFromID(String contactID) {
    ContactModel contact = ContactModel(
        id: 'o', name: 'Someone', email: 'Email@mail.com', imageUrl: 'pic', phone: '05000443356', salutation: 'Mr');
    for (final status in contacts) {
      if (status.id == contactID) {
        contact = status;
      }
    }
    return contact;
  }

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
