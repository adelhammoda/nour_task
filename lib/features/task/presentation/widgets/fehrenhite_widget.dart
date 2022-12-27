import 'package:flutter/material.dart';
import 'package:nour_task/core/managers/size_manager.dart';

class FehrenhiteWidget extends StatelessWidget {
  final String temperature;
  const FehrenhiteWidget({Key? key, required this.temperature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("36",style: TextStyle(
        fontSize: FontSizeManager.smallText(context)
    ),),
        Text('o',style: TextStyle(
          fontSize: FontSizeManager.verySmallText(context)-3
        ),),
        Text('c',style: TextStyle(
            fontSize: FontSizeManager.smallText(context)-5
        ),)
      ],
    );
  }
}
