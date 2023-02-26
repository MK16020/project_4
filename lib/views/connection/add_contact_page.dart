import 'package:flutter/material.dart';

import '../../../components/form_section.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  bool submit = false;
  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      setState(() {
        submit = nameController.text.isNotEmpty;
      });
    });
    emailController.addListener(() {
      setState(() {
        submit = nameController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  submitData() {
    var formData = formState.currentState;
    setState(() {
      submit = nameController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = 300.0;
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
          'Contacts/add Contact',
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
              FormSection(width: width, name: 'salutation', lines: 1, inputController: emailController),
              FormSection(width: width, name: 'name', lines: 1, inputController: nameController),
              FormSection(width: width, name: 'email', lines: 1, inputController: emailController),
              FormSection(width: width, name: 'Phone', lines: 1, inputController: emailController),
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
