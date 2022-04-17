import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class BookingDetailsItems extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;

  const BookingDetailsItems({
    Key? key,
    required this.title,
    required this.valueText,
    required this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 16,
            width: 16,
            margin: const EdgeInsets.only(
              right: 6,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_checkout.png'),
              ),
            ),
          ),
          Text(
            title,
            style: blackStyle,
          ),
          const Spacer(),
          Text(
            valueText,
            style: blackStyle.copyWith(fontWeight: semibold, color: valueColor),
          ),
        ],
      ),
    );
  }
}
