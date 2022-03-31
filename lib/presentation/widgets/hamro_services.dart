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
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      childAspectRatio: 1.18,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (var item in _hamroservices.services)
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (item['info'] == null)
                  ? Container(width: 0, height: 16)
                  : Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Text(
                        item['info'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      )),
              Icon(
                item['icon'],
                size: 38,
                color: AppColor.iconColor,
              ),
              const Spacer(),
              Text(
                item['text'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
            ],
          ),
      ],
    );
  }
}
