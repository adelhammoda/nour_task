import 'package:flutter/material.dart';
import 'package:nour_task/core/managers/color_manager.dart';

class HashTagWidget extends StatelessWidget {
  final String text;
  final Color fontColor;
  const HashTagWidget({Key? key, required this.text,  this.fontColor = ColorManager.darkGreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      color: ColorManager.secondary,
      ),
      padding: const EdgeInsets.all(5),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Text(
          text,
          style: TextStyle(
            color: fontColor
          ),
        ),
      ),
    );
  }
}
