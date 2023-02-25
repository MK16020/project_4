import 'package:flutter/material.dart';
import 'package:flutter_project_4/views/connection/add_contact_page.dart';

import '../../components/ticket_list_components/page_head.dart';
import '../../components/ticket_list_components/page_header.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
              path: 'Contact',
              isActive: true,
              icon: Icons.contact_page,
              page: AddContactPage(),
            ),
          ),
          Column(
            children: [
              const PageHead(
                name: 'Contact',
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
