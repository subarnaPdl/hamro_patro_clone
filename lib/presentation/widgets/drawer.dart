// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hamro_patro_clone/data/dataproviders/hamro_services.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final _hamroservices = HamroServices();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Header
          DrawerHeader(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                children: [
                  CircleAvatar(
                    child:
                        const Icon(Icons.person, color: Colors.white, size: 40),
                    radius: 30,
                    backgroundColor: Theme.of(context).iconTheme.color,
                  ),
                  const SizedBox(height: 20),
                  const Text("Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.darken),
                    image: const AssetImage('assets/images/bg.webp'))),
          ),

          // Sidemenu body

          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                minLeadingWidth: 20,
                leading: Image.asset(
                  'assets/images/hamropatro.png',
                  height: 25,
                ),
                title:
                    Text("Hamro Patro", style: TextStyle(color: Colors.red))),
          ),

          for (var item in _hamroservices.services)
            ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              minLeadingWidth: 20,
              leading: Icon(
                item['icon'],
                color: const Color(0xFF4e5054),
              ),
              title: Text(item['text']),
              trailing: (item['info'] == null)
                  ? Container(width: 0)
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        item['info'],
                        style: TextStyle(color: Colors.white),
                      )),
              onTap: () => {},
            ),
        ],
      ),
    );
  }
}
