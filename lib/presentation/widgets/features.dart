import 'package:flutter/material.dart';
import 'package:hamro_patro_clone/data/dataproviders/features.dart';
import 'package:hamro_patro_clone/presentation/resources/colors.dart';

class MoreFeaturesWidget extends StatefulWidget {
  const MoreFeaturesWidget({Key? key}) : super(key: key);

  @override
  State<MoreFeaturesWidget> createState() => _MoreFeaturesWidgetState();
}

class _MoreFeaturesWidgetState extends State<MoreFeaturesWidget> {
  final _features = MoreFeatures();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var item in _features.features)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 0.5),
                color: AppColor.cardColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(item['image'], height: 100),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      item['text'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
