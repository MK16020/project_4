import 'package:flutter/material.dart';
import 'package:flutter_project_4/models/contact_model.dart';
import 'package:flutter_project_4/models/ticket_model.dart';
import 'package:flutter_project_4/models/ticket_status_model.dart';

class TicketTable extends StatelessWidget {
  const TicketTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> headerTitles = [
      '#',
      'ID',
      'Priority',
      'Subject',
      'Contact',
      'Status',
      'Due Date',
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
        for (final ticket in TicketModel.tickets)
          DataRow(
            cells: <DataCell>[
              DataCell(SizedBox(
                  width: 10,
                  child: Text(
                    '${TicketModel.tickets.indexOf(ticket)}',
                    style: const TextStyle(color: Colors.grey),
                  ))),
              DataCell(SizedBox(
                  width: 10,
                  child: Text(
                    ticket.id,
                    style: const TextStyle(color: Colors.grey),
                  ))),
              DataCell(getPriority('${ticket.priority}')),
              DataCell(SizedBox(
                  width: 200,
                  child: ListTile(
                    title: Text(ticket.subject),
                    subtitle: Text(ticket.description),
                  ))),
              DataCell(
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      ContactModel.getContactFromID(ticket.contactID).name[0],
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  title: Text(ContactModel.getContactFromID(ticket.contactID).name),
                  subtitle: Text(ContactModel.getContactFromID(ticket.contactID).phone),
                ),
              ),
              DataCell(Text(TicketStatusModel.getStatusFromID(ticket.statusID).name)),
              DataCell(Text('${ticket.dueDate}')),
              DataCell(Text(ticket.createdAt)),
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
