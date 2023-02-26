import 'package:flutter/material.dart';
import 'package:flutter_project_4/models/reminder_model.dart';

import '../../models/contact_model.dart';

class ReminderTable extends StatelessWidget {
  const ReminderTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> headerTitles = [
      '#',
      'Title',
      'Description',
      'Contact',
      'Remind At',
    ];
    return DataTable(
      columns: <DataColumn>[
        for (final title in headerTitles)
          DataColumn(
            label: Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
      ],
      dataRowHeight: 80,
      rows: <DataRow>[
        for (final remind in ReminderModel.reminders)
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                ReminderModel.reminders.indexOf(remind).toString(),
                style: const TextStyle(color: Colors.grey),
              )),
              DataCell(Text(remind.title)),
              DataCell(SizedBox(width: 200, child: Text(remind.description))),
              DataCell(
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      ContactModel.getContactFromID(remind.contactID).name[0],
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  title: Text(ContactModel.getContactFromID(remind.contactID).name),
                  subtitle: Text(ContactModel.getContactFromID(remind.contactID).phone),
                ),
              ),
              DataCell(Text('${remind.createdAt}')),
            ],
          ),
      ],
    );
  }
}
