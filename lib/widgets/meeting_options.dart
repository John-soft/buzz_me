import 'package:buzz_me/utils/colors.dart';
import 'package:flutter/material.dart';

class MeetingOptions extends StatelessWidget {
  const MeetingOptions({
    Key? key,
    required this.text,
    required this.isMute,
    required this.onChange,
  }) : super(key: key);
  final String text;
  final bool isMute;
  final Function(bool) onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Switch.adaptive(value: isMute, onChanged: onChange),
        ],
      ),
    );
  }
}
