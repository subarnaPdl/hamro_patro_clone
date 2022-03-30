import 'package:flutter/material.dart';
import 'package:hamro_patro_clone/data/dataproviders/hamro_services.dart';
import 'package:hamro_patro_clone/presentation/resources/colors.dart';

class HamroServicesWidget extends StatefulWidget {
  const HamroServicesWidget({Key? key}) : super(key: key);

  @override
  State<HamroServicesWidget> createState() => _HamroServicesWidgetState();
}

class _HamroServicesWidgetState extends State<HamroServicesWidget> {
  final _hamroservices = HamroServices();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        children: [
          for (var item in _hamroservices.services)
            Column(
              children: [
                Icon(
                  item['icon'],
                  size: 36,
                  color: AppColor.iconColor,
                ),
                const SizedBox(height: 7),
                Text(
                  item['text'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
