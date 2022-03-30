// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hamro_patro_clone/data/dataproviders/hamro_services.dart';
import 'package:hamro_patro_clone/presentation/resources/colors.dart';

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
                    backgroundColor: AppColor.iconColor,
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
          for (var item in _hamroservices.services)
            ListTile(
              leading: Icon(item['icon'], color: Colors.black),
              title: Text(item['text'], style: TextStyle(color: Colors.black)),
              onTap: () => {},
            ),
        ],
      ),
    );
  }
}
