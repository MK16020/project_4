import 'package:flutter/material.dart';

import '../../components/home_components/dashboard_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const ListTile(
            title: Row(
              children: [
                Text('Dashboard/CRM'),
              ],
            ),
            trailing: Icon(Icons.calendar_month),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(
                BorderSide(color: Colors.black12, width: 0.5),
              ),
            ),
            child: const Text('Contacts'),
          ),
          const Row(
            children: [
              DashboardSection(),
              DashboardSection(),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(
                BorderSide(color: Colors.black12, width: 0.5),
              ),
            ),
            child: const Text('Tickets'),
          ),
          const Row(
            children: [
              DashboardSection(),
              DashboardSection(),
            ],
          ),
        ],
      ),
    );
  }
}
