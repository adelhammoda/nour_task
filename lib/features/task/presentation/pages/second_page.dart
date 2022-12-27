import 'package:flutter/material.dart';
import 'package:nour_task/core/managers/assets_manager.dart';
import 'package:nour_task/core/managers/color_manager.dart';
import 'package:nour_task/features/task/presentation/widgets/hashtag_widget.dart';
import 'package:responsive_s/responsive_s.dart';

import '../../domain/entities/task_entity.dart';
import '../widgets/parcentage_line.dart';
import '../widgets/switch_button.dart';
import '../widgets/today_task_tile.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorManager.darkGreen,
          ),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ColorManager.secondary,
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Row(
                children:const [
                  Icon(
                    Icons.edit,
                    color: ColorManager.darkGreen,
                  ),
                  Text("Edit")
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.qrCode)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: ColorManager.whiteColor.withOpacity(0.4))),
                    width: responsive.responsiveWidth(forUnInitialDevices: 30),
                    height: responsive.responsiveWidth(forUnInitialDevices: 30),
                    child: Image.asset(
                      AssetsManager.girl,
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                  height: responsive.responsiveWidth(forUnInitialDevices: 30),
                  width: responsive.responsiveWidth(forUnInitialDevices: 60),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(
                          children: [
                            TextSpan(text: 'FIGMA ',style: Theme.of(context)
                                .textTheme
                                .bodyMedium!.copyWith(
                              fontSize: 24
                            )),
                            TextSpan(text: "30DAY'S ",style: Theme.of(context)
                                .textTheme
                                .bodyMedium!.copyWith(
                                fontSize: 24,
                              color: ColorManager.darkGreen
                            )),
                            TextSpan(text: 'CHALANGE',style: Theme.of(context)
                                .textTheme
                                .bodyMedium!.copyWith(
                                fontSize: 24
                            )),
                          ]
                        ),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith()),
                        Text("Deepak Ray",style: Theme.of(context)
                            .textTheme.bodyMedium),
                        SizedBox(
                        height: responsive.responsiveHeight(forUnInitialDevices:4),
                          child: ListView.builder(
                            itemCount: 2,
                              scrollDirection: Axis.horizontal,itemBuilder: (c,index)=>const Padding(
                            padding:  EdgeInsets.all(2.0),
                            child:  HashTagWidget(text: 'Design & Art'),
                          )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Text(
                  "People often overlook the power of simple walking. It increases cardiovascular and pulmonary. Optimize your schedule for this approach by blocking out time at the start of every day...",style: Theme.of(context)
                  .textTheme.bodyMedium!.copyWith(
                color: ColorManager.whiteColor.withOpacity(0.7)
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: PercentageLine(
                width: responsive.responsiveWidth(forUnInitialDevices: 100),
                high: 15,
                percentage: 47,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, top: 15,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('PEPOLE JOINED',style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: ColorManager.whiteColor.withOpacity(0.5),fontSize: 19)),
                  Row(
                    children: [
                      SwitchButton(
                        content: ['Tasks', 'Pepole'],
                        width:
                            responsive.responsiveWidth(forUnInitialDevices: 30),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Image.asset(AssetsManager.shareCircle),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (c, index) => TodayTaskTile(
                  index: index,
                  taskEntity: TaskEntity(
                      date: DateTime.now(),
                      duration: const Duration(hours: 24),
                      id: '',
                      imageUrl: '',
                      description:
                          'People often overlook the power of simple walking. It increases cardiovascular and pulmonary',
                      statues: TaskStatues.done,
                      title: 'WORK TO DO'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
