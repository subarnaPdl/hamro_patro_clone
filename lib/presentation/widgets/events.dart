import 'package:flutter/material.dart';
import 'package:hamro_patro_clone/data/dataproviders/dates.dart';
import 'package:hamro_patro_clone/presentation/resources/colors.dart';

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
        Image.asset(
          "assets/images/event_image.jpg",
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
