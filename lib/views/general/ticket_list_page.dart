import 'package:flutter/material.dart';
import 'package:flutter_project_4/views/general/add_pages/add_ticket_page.dart';

import '../../components/ticket_list_components/page_head.dart';
import '../../components/ticket_list_components/page_header.dart';
import '../../components/ticket_list_components/ticket_table.dart';

class TicketListPage extends StatefulWidget {
  const TicketListPage({super.key});

  @override
  State<TicketListPage> createState() => _TicketListPageState();
}

class _TicketListPageState extends State<TicketListPage> {
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
              path: 'Tickets',
              isActive: true,
              icon: Icons.receipt,
              page: AddTicketPage(),
            ),
          ),
          Column(
            children: [
              const PageHead(
                name: 'Ticket',
              ),
              SizedBox(
                height: 500,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: const [
                    TicketTable(),
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
