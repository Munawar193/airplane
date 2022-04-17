import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class InterestsItem extends StatelessWidget {
  final String text;

  const InterestsItem({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_checkout.png'),
              ),
            ),
          ),
          Text(
            text,
            style: blackStyle,
          )
        ],
      ),
    );
  }
}
