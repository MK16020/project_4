import 'package:flutter/material.dart';

class ReminderTable extends StatelessWidget {
  const ReminderTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> headerTitles = [
      '#',
      'ID',
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
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
      ],
      dataRowHeight: 80,
      rows: <DataRow>[
        // for (int i = 0; i < 15; i++)
        DataRow(
          cells: <DataCell>[
            const DataCell(Text('1')),
            const DataCell(Text('2345')),
            const DataCell(Text('someone\'s birthday')),
            const DataCell(SizedBox(width: 200, child: Text('Happy life'))),
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
                  child: const Text(
                    'M',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                title: const Text('Mohammed'),
                subtitle: const Text('+966583927562'),
              ),
            ),
            const DataCell(Text('Tomorrow')),
          
          ],
        ),
      ],
    );
  }
}
