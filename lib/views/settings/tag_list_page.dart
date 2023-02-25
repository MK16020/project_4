import 'package:flutter/material.dart';

import '../../components/ticket_list_components/page_head.dart';
import '../../components/ticket_list_components/page_header.dart';
import 'add_pages/add_tag_page.dart';

class TagListPage extends StatelessWidget {
  const TagListPage({super.key});

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
              path: 'Tags',
              isActive: false,
              icon: Icons.tag,
              page: AddTagPage(),
            ),
          ),
          Column(
            children: [
              const PageHead(
                name: 'Tags',
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
