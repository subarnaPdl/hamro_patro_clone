import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamro_patro_clone/presentation/resources/colors.dart';
import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final npNow = NepaliDateTime.parse(NepaliDateTime.now().toIso8601String());
  late final time = NepaliDateFormat("h : mm aa").format(npNow);
  late final npToday = NepaliDateFormat("EEE, d MMMM, y").format(npNow);
  nextNpDate({int days = 0}) => NepaliDateFormat("MMMM d")
      .format(NepaliDateTime(npNow.year, npNow.month, npNow.day + days));
  late final event =
      NepaliDateFormat("MMMM", Language.nepali).format(npNow) + " कृष्ण अष्टमी";

  final engNow = DateTime.now();
  late final engDateToday = DateFormat("MMM d, y").format(engNow);
  nextEngDate({int days = 0}) => DateFormat("d MMM y")
      .format(DateTime(engNow.year, engNow.month, engNow.day + days));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            /*-----------Top Card Views-------------*/
            topCardView(context),
            const SizedBox(height: 20),

            /*-----------Upcoming Events-------------*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Upcoming Events",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Icon(Icons.arrow_forward)
              ],
            ),
            const SizedBox(height: 10),

            //
            Container(
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
      ),
    );
  }

  Container events(BuildContext context, int index) {
    return Container(
      width: 0.8 * MediaQuery.of(context).size.width,
      height: 100,
      padding: const EdgeInsets.only(right: 10),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black87, width: 0.2),
        color: AppColor.cardColor,
      ),
      child: Row(
        children: [
          Image.network(
            "https://images.hamro-files.com/3WI0siJk5xtWllI6X1B6snUivVA=/http://storage.googleapis.com/hamropatro-storage/assets/hamropatro.com/images/1a65ce43-efd0-4923-8460-6c21b2d43dda.jpg",
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nextNpDate(days: index),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("$index days after")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text("World Newah Day"), Text(">")],
                ),
                Text(nextEngDate(days: index)),
              ],
            ),
          )
        ],
      ),
    );
  }

  topCardView(BuildContext context) {
    return Container(
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

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.primaryColor,
          statusBarIconBrightness: Brightness.light),
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
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.brightness_6_rounded),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.email_outlined),
        ),
      ],
      actionsIconTheme: IconThemeData(color: AppColor.iconColor),
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GestureDetector(
          child: Icon(Icons.menu, color: AppColor.iconColor),
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      leadingWidth: 30,
    );
  }
}
