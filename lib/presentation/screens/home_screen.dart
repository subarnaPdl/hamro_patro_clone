import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamro_patro_clone/data/dataproviders/dates.dart';
import 'package:hamro_patro_clone/data/models/theme_mode.dart';
import 'package:hamro_patro_clone/presentation/widgets/drawer.dart';
import 'package:hamro_patro_clone/presentation/widgets/events.dart';
import 'package:hamro_patro_clone/presentation/widgets/features.dart';
import 'package:hamro_patro_clone/presentation/widgets/hamro_services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*-----------Top Card Views-------------*/
            topCardView(context),
            const SizedBox(height: 15),

            /*-----------Upcoming Events-------------*/
            upcomingEvents(),
            const SizedBox(height: 15),

            /*-----------Notification-------------*/
            notification(context),
            const SizedBox(height: 10),

            /*-----------Hamro Services-------------*/
            hamroServices(),
            const SizedBox(height: 20),

            /*-----------Promotions-------------*/
            promotions(context),

            /*-----------More Features-------------*/
            moreFeatures(),
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarIconBrightness: Brightness.light),
      iconTheme: Theme.of(context).iconTheme,

      leadingWidth: 25,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  color: Theme.of(context).iconTheme.color,
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
          const Text(
            "Hamro Patro",
            style: TextStyle(
              color: Color(0xFFc93244),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

      //
      actions: [
        // Dark / Light Mode
        IconButton(
          onPressed: () {
            final themeProvider =
                Provider.of<ThemeProvider>(context, listen: false);
            Provider.of<ThemeProvider>(context, listen: false)
                .toggleTheme(themeProvider.isDarkMode);
          },
          icon: const Icon(Icons.brightness_6_rounded),
        ),

        // Message
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.email_outlined),
        ),
      ],
      // actionsIconTheme: IconThemeData(color: AppColor.iconColor),
    );
  }

  topCardView(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Theme.of(context).shadowColor, width: 0.2),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Today Info
          Text(npToday, style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 10),

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
                  color: Theme.of(context).scaffoldBackgroundColor,
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
                        color: Theme.of(context).primaryColor,
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
            children: [
              Text(
                "Upcoming Events",
                style: Theme.of(context).textTheme.headline2,
              ),
              const Icon(Icons.arrow_forward, size: 20)
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

  notification(BuildContext context) {
    return Container(
      color: Theme.of(context).highlightColor,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          // Message Button
          ElevatedButton.icon(
            onPressed: () {},
            label: Text(
              'Message',
              style: Theme.of(context).textTheme.headline6,
            ),
            icon: const Icon(Icons.message, color: Color(0xFFfd5151)),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              side: const BorderSide(width: 0.7, color: Colors.black),
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
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                WidgetSpan(child: Icon(Icons.call, size: 16)),
              ],
            ),
          ))
        ],
      ),
    );
  }

  hamroServices() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hamro Services",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 10),
          const HamroServicesWidget(),
        ],
      ),
    );
  }

  promotions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      color: Theme.of(context).bannerTheme.backgroundColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          for (var item in [
            "assets/images/promo1.jpg",
            "assets/images/promo2.jpg",
            "assets/images/promo3.jpg"
          ])
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item,
                  height: 150,
                  width: 0.85 * MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
        ]),
      ),
    );
  }

  moreFeatures() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purple,
                  ),
                  child: const Icon(
                    Icons.dashboard_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "More Features",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ]),
              const Icon(Icons.arrow_forward, size: 25),
            ],
          ),
          const SizedBox(height: 5),

          // -------------------------------- //
          const Text(
            "Other services we provide",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          const SizedBox(height: 10),

          // -------------------------------- //
          const MoreFeaturesWidget(),
        ],
      ),
    );
  }
}
