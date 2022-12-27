import 'package:flutter/material.dart';
import 'package:nour_task/core/managers/color_manager.dart';

class PercentageLine extends StatelessWidget {
  final double width;
  final double high;
  final double percentage;

  const PercentageLine(
      {Key? key,
      required this.width,
      required this.high,
      required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(percentage < 100 || percentage > 0);
    return Column(
      children: [
        Container(
          height: high,
          width: width,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: ColorManager.secondary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            height: high,
            decoration: BoxDecoration(
                color: ColorManager.darkGreen,
                borderRadius: BorderRadius.circular(30)),
            width: width * (percentage / 100),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0,left:10 ,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${percentage.toInt()}%",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: ColorManager.darkGreen)),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: '26 ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorManager.darkGreen)),
                TextSpan(text: "Day's left", style: Theme.of(context)
                    .textTheme
                    .bodyMedium!),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
