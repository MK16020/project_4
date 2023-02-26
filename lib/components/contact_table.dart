import 'package:flutter/material.dart';
import 'package:flutter_project_4/models/contact_model.dart';
import 'package:intl/intl.dart';

class ContactTable extends StatelessWidget {
  const ContactTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> headerTitles = [
      '#',
      'Logo',
      'Name',
      'Mobile',
      'Tag',
      'Created At',
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
        for (final contact in ContactModel.contacts)
          DataRow(
            cells: <DataCell>[
              DataCell(SizedBox(
                  width: 10,
                  child: Text(
                    '${ContactModel.contacts.indexOf(contact)}',
                    style: const TextStyle(color: Colors.grey),
                  )),
                  onTap: () {
                    
                  },
                  ),
              DataCell(
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    contact.name[0],
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              DataCell(Text(contact.name)),
              DataCell(Text(contact.phone)),
              const DataCell(Text('-')),
              DataCell(Text(DateFormat.yMMMEd().format(DateTime.now()))),
            ],
          ),
      ],
    );
  }
}

Icon getPriority(String priority) {
  switch (priority) {
    case 'Low':
      return const Icon(
        Icons.flag,
        color: Colors.grey,
      );
    case 'Medium':
      return const Icon(
        Icons.flag,
        color: Colors.blue,
      );
    case 'High':
      return const Icon(
        Icons.flag,
        color: Colors.orange,
      );
    case 'Urgent':
      return const Icon(
        Icons.flag,
        color: Colors.red,
      );
    default:
      return const Icon(Icons.remove);
  }
}
