import 'package:flutter/material.dart';

import '../../../components/form_section.dart';

class AddReminderPage extends StatefulWidget {
  const AddReminderPage({super.key});

  @override
  State<AddReminderPage> createState() => _AddReminderPageState();
}

class _AddReminderPageState extends State<AddReminderPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  final subjectController = TextEditingController();
  final descriptionController = TextEditingController();
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
    var width = MediaQuery.of(context).size.width * 0.5;
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
          'Reminders/add Reminder',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        Form(
          key: formState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormSection(
                width: width,
                name: 'Subject',
                lines: 1,
                inputController: subjectController,
              ),
              FormSection(width: width, name: 'Description', lines: 5, inputController: descriptionController),
              ElevatedButton(
                onPressed: submit ? () => submitData : null,
                style: ElevatedButton.styleFrom(surfaceTintColor: const Color(0xff0000ff)),
                child: const Text('Create'),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
