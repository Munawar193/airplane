import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String icon;
  final String text;
  final String backIcon;
  final double width;
  final double height;

  const ProfileItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.backIcon,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: height,
          width: width,
          margin: const EdgeInsets.only(top: 10, right: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(icon),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 9),
            child: Text(
              text,
              style: greyStyle.copyWith(fontSize: 15, fontWeight: medium),
            ),
          ),
        ),
        Container(
          height: 14,
          width: 14,
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backIcon),
            ),
          ),
        ),
      ],
    );
  }
}
