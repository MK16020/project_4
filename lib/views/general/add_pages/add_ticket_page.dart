import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_4/components/form_section.dart';
import 'package:flutter_project_4/models/ticket_model.dart';
import 'package:flutter_project_4/models/ticket_status_model.dart';
import 'package:intl/intl.dart';

class AddTicketPage extends StatefulWidget {
  const AddTicketPage({super.key});

  @override
  State<AddTicketPage> createState() => _AddTicketPageState();
}

class _AddTicketPageState extends State<AddTicketPage> {
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
  final contactsController = TextEditingController();
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
    var width = 300.0;
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
                FormSection(width: width, name: 'Contact', inputController: contactsController),
                FormSection(width: width, name: 'Subject', inputController: subjectController),
                FormSection(width: width, name: 'Description', inputController: descriptionController),
                const Text('Status'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: const Color(0xffE3E6E7), borderRadius: BorderRadius.circular(10)),
                  child: dropdownButton,
                ),
                const SizedBox(height: 16),
                const Text('Priority'),
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
                        ),
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
                ElevatedButton(
                  onPressed: () {
                    var createdAt = DateFormat.yMMMEd().format(DateTime.now());
                    var ticketID = TicketModel.tickets.length.toString();
                    TicketModel ticket = TicketModel(
                      id: ticketID,
                      subject: subjectController.text.trim(),
                      description: descriptionController.text.trim(),
                      statusID: TicketStatusModel.statuses.first.id,
                      priority: priority[selected],
                      createdAt: createdAt,
                      contactID: contactsController.text.trim(),
                    );
                    FirebaseFirestore.instance.collection('Ticket').doc(ticketID).set(ticket.toMap());
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff0000ff)),
                  child: const Text('Create'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
