import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../components/form_section.dart';
import '../../../models/contact_model.dart';
import '../../../models/ticket_model.dart';
import '../../../models/ticket_status_model.dart';

class EditTicketPage extends StatefulWidget {
  const EditTicketPage({super.key, required this.editTicket});
  final TicketModel editTicket;

  @override
  State<EditTicketPage> createState() => _EditTicketPageState();
}

class _EditTicketPageState extends State<EditTicketPage> {
  final List<String> priority = ['Low', 'Medium', 'High', 'Urgent'];
  int selected = 0;
  String selectedValue = TicketStatusModel.statuses.first.name;
  List<DropdownMenuItem<String>> menuItems = [
    for (final status in TicketStatusModel.statuses) DropdownMenuItem(value: status.name, child: Text(status.name)),
  ];

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final subjectController = TextEditingController();
  final descriptionController = TextEditingController();
  final dueDateController = TextEditingController();
  var selectedContact =
      ContactModel(id: '-1', name: 'demo', email: 'mail', imageUrl: 'pic', phone: '043', salutation: 'non');
  bool submit = false;

  @override
  void initState() {
    super.initState();
    subjectController.addListener(() {
      setState(() {
        submit = subjectController.text.isNotEmpty;
      });
    });
    descriptionController.addListener(() {
      setState(() {
        submit = subjectController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    subjectController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  submitData() {
    var formData = formState.currentState;
    setState(() {
      submit = subjectController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = 400.0;
    var dropdownButton = DropdownButton(
      items: menuItems,
      value: selectedValue,
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue as String;
        });
      },
      underline: const SizedBox(),
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 42,
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'tickets/add ticket',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Contact'),
                const SizedBox(height: 16),
                Container(
                  color: const Color(0xffE3E6E7),
                  width: width,
                  child: DropdownSearch<ContactModel>(
                    items: ContactModel.contacts,
                    itemAsString: (ContactModel u) => u.name,
                    onChanged: (selected) {
                      selectedContact = selected!;
                    },
                    selectedItem: ContactModel.getContactFromID(widget.editTicket.contactID),
                  ),
                ),
                const SizedBox(height: 16),
                FormSection(width: width, name: 'Subject', inputController: subjectController),
                FormSection(
                  width: width,
                  name: 'Description',
                  inputController: descriptionController,
                  lines: 5,
                ),
                const Text('Status'),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: const Color(0xffE3E6E7), borderRadius: BorderRadius.circular(10)),
                  child: dropdownButton,
                ),
                const SizedBox(height: 16),
                const Text('Priority'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    for (var i = 0; i < priority.length; i++) ...[
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selected = i;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: (selected == i) ? Colors.blue : const Color(0xffE3E6E7),
                            fixedSize: const Size(100, 50)),
                        child: Row(
                          children: [
                            const Icon(Icons.flag, size: 12, color: Colors.black),
                            Text(
                              priority[i],
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        var createdAt = DateFormat.yMMMEd().format(DateTime.now());

                        TicketModel ticket = TicketModel(
                          id: widget.editTicket.id,
                          subject: subjectController.text.trim(),
                          description: descriptionController.text.trim(),
                          statusID: TicketStatusModel.statuses.first.id,
                          priority: priority[selected],
                          createdAt: createdAt,
                          contactID: selectedContact.id,
                        );
                        FirebaseFirestore.instance.collection('Ticket').doc(widget.editTicket.id).set(ticket.toMap());
                        Navigator.pop(context);

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                              backgroundColor: Colors.green,
                              title: Text(
                                'Ticket Edited successfully',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        );
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0000ff), fixedSize: const Size(100, 50)),
                      child: const Text('Edit'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        FirebaseFirestore.instance.collection('Ticket').doc(widget.editTicket.id).delete();
                        TicketModel.tickets.remove(widget.editTicket);
                        Navigator.pop(context);
                        
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, fixedSize: const Size(100, 50)),
                      child: const Text('Delete'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
