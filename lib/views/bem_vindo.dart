import 'package:flutter/material.dart';
import 'package:flutter_validation/views/contacts.dart';
import 'package:flutter_validation/views/dashboard.dart';
import 'package:flutter_validation/widgets/my_drawer_header.dart';

class BemVindo extends StatefulWidget {
  const BemVindo({Key? key}) : super(key: key);

  @override
  State<BemVindo> createState() => _BemVindoState();
}

class _BemVindoState extends State<BemVindo> {
  var currentPage = DrawerSections.dashBoard;

  @override
  Widget build(BuildContext context) {
    var container;

    if (currentPage == DrawerSections.dashBoard) {
      container = DashBoard();
    } else if (currentPage == DrawerSections.contacts) {
      container = Contacts();
    }
    return Scaffold(
      appBar: _CustonAppBar(),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _CustonAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 90,
      title: Text('Bem Vindo'),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(00),
            ),
            gradient: LinearGradient(
              colors: [Colors.black, Colors.green],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
      ),
    );
  }

  MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          MenuItem(1, 'DashBoard', Icons.dashboard_outlined,
              currentPage == DrawerSections.dashBoard ? true : false),
          MenuItem(2, 'Contacts', Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          MenuItem(3, 'Events', Icons.event,
              currentPage == DrawerSections.events ? true : false),
          Divider(),
          MenuItem(4, 'Notes', Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          MenuItem(5, 'Settings', Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
        ],
      ),
    );
  }

  MenuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashBoard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                  child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashBoard,
  contacts,
  events,
  notes,
  settings,
  notifications,
}
