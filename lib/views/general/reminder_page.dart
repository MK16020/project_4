import 'package:flutter/material.dart';
import 'package:flutter_project_4/views/general/add_pages/add_reminder_page.dart';

import '../../components/reminder_components/reminder_table.dart';
import '../../components/ticket_list_components/page_head.dart';
import '../../components/ticket_list_components/page_header.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(
                BorderSide(color: Colors.black12, width: 0.5),
              ),
            ),
            child: const PageHeader(
              path: 'Reminders',
              isActive: false,
              icon: Icons.event_repeat,
              page: AddReminderPage(),
            ),
          ),
          Column(
            children: [
              const PageHead(
                name: 'Reminders',
              ),
              SizedBox(
                height: 500,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: const [
                    ReminderTable(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
