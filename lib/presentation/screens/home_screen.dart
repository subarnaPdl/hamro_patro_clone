// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamro_patro_clone/data/dataproviders/dates.dart';
import 'package:hamro_patro_clone/presentation/resources/colors.dart';
import 'package:hamro_patro_clone/presentation/widgets/drawer.dart';
import 'package:hamro_patro_clone/presentation/widgets/events.dart';
import 'package:hamro_patro_clone/presentation/widgets/hamro_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*-----------Top Card Views-------------*/
            topCardView(context),
            const SizedBox(height: 20),

            /*-----------Upcoming Events-------------*/
            upcomingEvents(),
            const SizedBox(height: 18),

            /*-----------Notification-------------*/
            Container(
              color: AppColor.notificationColor,
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  // Message Button
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('Message',
                        style: TextStyle(color: Colors.black)),
                    icon: Icon(Icons.message, color: AppColor.secondaryColor),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      side: const BorderSide(width: 0.7, color: Colors.black87),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                  const SizedBox(width: 30),

                  const Flexible(
                      child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Click here for free audio and video call ',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                        WidgetSpan(child: Icon(Icons.call, size: 16)),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            const SizedBox(height: 10),

            /*-----------Hamro Services-------------*/
            hamroServices(),
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.primaryColor,
          statusBarIconBrightness: Brightness.light),
      iconTheme: IconThemeData(color: AppColor.iconColor),

      leadingWidth: 25,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  color: AppColor.iconColor,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "Hamro Patro",
            style: TextStyle(
                color: AppColor.secondaryColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),

      //
      actions: [
        // Dark / Light Mode
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.brightness_6_rounded),
        ),

        // Message
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.email_outlined),
        ),
      ],
      actionsIconTheme: IconThemeData(color: AppColor.iconColor),
    );
  }

  topCardView(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey, width: 0.2),
        color: AppColor.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Today Info
          Text(
            npToday,
            style: GoogleFonts.mulish(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),

          /*--------------------------------*/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Current Time
                  Text(time),
                  const SizedBox(height: 4),

                  // Today's event
                  Text(event),

                  // Today's english date
                  Text(
                    engDateToday,
                    style: GoogleFonts.mulish(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),

                  // Weather Info
                  Row(
                    children: [
                      const Icon(Icons.cloud, size: 16),
                      const SizedBox(width: 10),
                      Text(
                        "24 \u2103 | Thapathali",
                        style: GoogleFonts.mulish(),
                      )
                    ],
                  )
                ],
              ),

              // My Notes
              Container(
                width: 0.28 * MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    // Add Notes text
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        color: AppColor.primaryColor,
                      ),
                      child: const Text(
                        "+ My Note",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Note set for today
                    const Text("Add note for today",
                        style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 15),

                    // View Notes
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.2),
                        ),
                      ),
                      child: const Text(
                        "View Notes \u2192",
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  upcomingEvents() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Upcoming Events",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Icon(Icons.arrow_forward, size: 20)
            ],
          ),
          const SizedBox(height: 8),

          //
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return events(context, index + 1);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container hamroServices() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Hamro Services",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(height: 15),
          HamroServicesWidget(),
        ],
      ),
    );
  }
}
