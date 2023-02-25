import 'package:flutter/material.dart';

import '../../components/home_components/dashboard_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Row(
              children: const [
                Text('Dashboard/CRM'),
              ],
            ),
            trailing: const Icon(Icons.calendar_month),
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
          Row(
            children: const [
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
            child: const Text('Contacts'),
          ),
          Row(
            children: const [
              DashboardSection(),
              DashboardSection(),
            ],
          ),
        ],
      ),
    );
  }
}
