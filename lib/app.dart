import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_4/models/page_tag_model.dart';
import 'package:flutter_project_4/models/reminder_model.dart';
import 'package:flutter_project_4/models/ticket_model.dart';
import 'package:flutter_project_4/models/ticket_status_model.dart';
import 'package:flutter_project_4/views/login/login_page.dart';
import 'package:flutter_project_4/views/navigation_drawer_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<TicketModel> ticketList = [];
  List<ReminderModel> reminderList = [];
  List<TicketStatusModel> statusList = [];
  List<PageTagModel> tags = [];
  @override
  void initState() {
    super.initState();
    ticketMethod();
    reminderMethod();
    statusMethod();
    tagMethod();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future ticketMethod() async {
    await FirebaseFirestore.instance.collection('Ticket').get().then((value) {
      final docs = value.docs;
      for (final doc in docs) {
        final data = doc.data();
        final ticketFromData = TicketModel.fromMap(data);
        ticketList.add(ticketFromData);
      }
      TicketModel.tickets = ticketList;
      TicketModel.tickets.add(TicketModel(
          id: '1',
          subject: 'Hello',
          description: "Hello world discretion ",
          statusID: '2',
          createdAt: '12/1/2024',
          contactID: '0'));
      setState(() {});
    });
  }

  Future reminderMethod() async {
    await FirebaseFirestore.instance.collection('Reminder').get().then((value) {
      final docs = value.docs;
      for (final doc in docs) {
        final data = doc.data();
        final reminderFromData = ReminderModel.fromMap(data);

        reminderList.add(reminderFromData);
      }
      ReminderModel.reminders = reminderList;
      ReminderModel.reminders.add(ReminderModel(
          id: '2',
          title: 'Hello world',
          description: 'this is a test for hello world',
          dueDate: 1545654,
          createdAt: 3245465));
      setState(() {});
    });
  }

  Future statusMethod() async {
    await FirebaseFirestore.instance.collection('Status').get().then((value) {
      final docs = value.docs;
      for (final doc in docs) {
        final data = doc.data();
        final statusFromData = TicketStatusModel.fromMap(data);

        statusList.add(statusFromData);
      }
      TicketStatusModel.statuses = statusList;
      TicketStatusModel.statuses.add(TicketStatusModel(id: '2', name: 'On Hold', color: 'amber'));
      setState(() {});
    });
  }

  Future tagMethod() async {
    await FirebaseFirestore.instance.collection('Tag').get().then((value) {
      final docs = value.docs;
      for (final doc in docs) {
        final data = doc.data();
        final tagFromData = PageTagModel.fromMap(data);

        tags.add(tagFromData);
      }
      PageTagModel.tags = tags;
      PageTagModel.tags.add(PageTagModel(id: '2', name: 'search', color: 'Yellow', isActive: true));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.hasData ? const NavigationDrawerPage() : const LoginPage();
        },
      ),
      theme: ThemeData(primaryColor: const Color(0xff9ca3af), fontFamily: 'RobotoCondensed'),
      debugShowCheckedModeBanner: false,
    );
  }
}
