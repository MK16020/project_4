import 'package:flutter/material.dart';

import '../../components/ticket_list_components/page_head.dart';
import '../../components/ticket_list_components/page_header.dart';
import 'add_pages/add_ticket_status_page.dart';

class TicketStatusPage extends StatelessWidget {
  const TicketStatusPage({super.key});

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
              path: 'Ticket Status',
              isActive: false,
              icon: Icons.flag,
              page: AddTicketStatusPage(),
            ),
          ),
          Column(
            children: [
              const PageHead(
                name: 'Ticket Status',
              ),
              SizedBox(
                height: 500,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: const [],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
