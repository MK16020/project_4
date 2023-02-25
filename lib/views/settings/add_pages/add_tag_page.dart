import 'package:flutter/material.dart';
import 'package:flutter_project_4/components/form_section.dart';

class AddTagPage extends StatefulWidget {
  const AddTagPage({super.key});

  @override
  State<AddTagPage> createState() => _AddTagPageState();
}

class _AddTagPageState extends State<AddTagPage> {
  final subjectController = TextEditingController();
  final descriptionController = TextEditingController();
  final dueDateController = TextEditingController();
  final contactsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = 300.0 ;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FormSection(width: width, name: 'name', inputController: subjectController),
            ],
          ),
        ),
      ],
    );
  }
}
