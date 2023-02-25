import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_4/views/connection/contact_page.dart';
import 'package:flutter_project_4/views/general/home_page.dart';
import 'package:flutter_project_4/views/general/reminder_page.dart';
import 'package:flutter_project_4/views/general/ticket_list_page.dart';
import 'package:flutter_project_4/views/settings/tag_list_page.dart';
import 'package:flutter_project_4/views/settings/ticket_status_page.dart';

class NavigationDrawerPage extends StatefulWidget {
  const NavigationDrawerPage({super.key});

  @override
  State<NavigationDrawerPage> createState() => _NavigationDrawerPageState();
}



class _NavigationDrawerPageState extends State<NavigationDrawerPage> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  List<Pages> pages = [
    Pages(page: const HomePage(), title: 'Dashboard', index: 0, icon: Icons.dashboard),
    Pages(page: const TicketListPage(), title: 'Tickets', index: 1, icon: Icons.receipt),
    Pages(page: const ReminderPage(), title: 'Reminders', index: 2, icon: Icons.event_repeat),
    Pages(page: const ContactPage(), title: 'Contacts', index: 3, icon: Icons.contact_page),
    Pages(page: const TagListPage(), title: 'Tags', index: 4, icon: Icons.tag),
    Pages(page: const TicketStatusPage(), title: 'Tickets Status', index: 5, icon: Icons.flag),
  ];

  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }

  @override
  void dispose() {
    page.dispose();
    sideMenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideMenu(
            items: [
              for (final screen in pages)
                SideMenuItem(
                  onTap: (page, _) {
                    sideMenu.changePage(page);
                  },
                  title: screen.title,
                  icon: Icon(screen.icon),
                  priority: screen.index,
                ),
            ],
            controller: sideMenu,
            title: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              width: 200,
              child: const Image(image: AssetImage('assets/images/logo.png')),
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text('Logout', style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
            ),
            style: SideMenuStyle(
              backgroundColor: const Color(0xff111827),
              selectedColor: const Color(0xff242a38),
              displayMode: SideMenuDisplayMode.auto,
              selectedTitleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
              unselectedTitleTextStyle: const TextStyle(color: Color(0xff585d67), fontSize: 16),
              selectedIconColor: Colors.white,
              unselectedIconColor: const Color(0xff585d67),
              itemOuterPadding: const EdgeInsets.symmetric(horizontal: 20),
              itemInnerSpacing: 32,
            ),
            showToggle: true,
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                for (final screen in pages)
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Center(child: screen.page),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Pages {
  final Widget page;
  final String title;
  final int index;
  final IconData icon;

  Pages({
    required this.page,
    required this.title,
    required this.index,
    required this.icon,
  });
}
