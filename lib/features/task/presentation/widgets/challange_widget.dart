import 'package:flutter/material.dart';
import 'package:nour_task/core/managers/assets_manager.dart';
import 'package:nour_task/core/managers/routes_manager.dart';
import 'package:nour_task/features/task/presentation/widgets/hashtag_widget.dart';
import 'package:nour_task/features/task/presentation/widgets/parcentage_line.dart';
import 'package:responsive_s/responsive_s.dart';

import '../../../../core/managers/color_manager.dart';

class ChallengeWidget extends StatelessWidget {
  const ChallengeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(Routes.secondPage);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: responsive.responsiveHeight(forUnInitialDevices: 35),
        width: responsive.responsiveWidth(forUnInitialDevices: 45),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorManager.whiteColor.withOpacity(0.15),
                ColorManager.darkBlack,
              ],
            )),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorManager.whiteColor.withOpacity(0.4),
                          width: 2)),
                  height: responsive.responsiveWidth(forUnInitialDevices: 17),
                  child: Image.asset(
                    AssetsManager.girl,
                    width: responsive.responsiveWidth(forUnInitialDevices: 15),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'FIGMA ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 13,
                                  )),
                          TextSpan(
                              text: '30DAYS ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 13,
                                      color: ColorManager.darkGreen)),
                          TextSpan(
                              text: 'Chalanege ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 13,
                                  ))
                        ]),
                      ),
                      Text("Depake ray",
                          style: Theme.of(context).textTheme.bodySmall),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            height: 23,
                              child: ListView.builder(
                                itemCount: 2,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (c, index) =>
                                      const Padding(
                                        padding: EdgeInsets.all(1.0),
                                        child: HashTagWidget(text: 'Disign'),
                                      )))),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: PercentageLine(
                  width: responsive.responsiveWidth(forUnInitialDevices: 50) - 10,
                  high: 10,
                  percentage: 40),
            ),
            Expanded(
              child: SizedBox(

                  width: responsive.responsiveWidth(forUnInitialDevices: 40),
                  child: Text(
                      '''People often overlook the power of simple walking. It increases cardiovascular and pulmonary. Optimize your schedule for this approach by blocking out time at the start of every day...''',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children:const [
                    CircleAvatar(
                      radius: 10,

                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child:
                          CircleAvatar(radius: 10, backgroundColor: ColorManager.darkGreen),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child:
                          CircleAvatar(radius: 10, backgroundColor: ColorManager.darkGreen),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: ColorManager.darkGreen,
                        child: Text('+3'),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("joined on",style: Theme.of(context).textTheme.bodySmall,),
                    Text("03 may 2021",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 10
                    )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
