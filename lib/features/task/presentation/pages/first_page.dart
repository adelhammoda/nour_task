import 'package:flutter/material.dart';
import 'package:nour_task/core/managers/assets_manager.dart';
import 'package:nour_task/core/managers/color_manager.dart';
import 'package:nour_task/features/task/domain/entities/task_entity.dart';
import 'package:nour_task/features/task/presentation/widgets/switch_button.dart';
import 'package:responsive_s/responsive_s.dart';

import '../../../../core/common/widgets/app_bar.dart';
import '../widgets/challange_widget.dart';
import '../widgets/today_task_tile.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    return Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                height: responsive.responsiveHeight(forUnInitialDevices: 35),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c,index)=>
                  index==0?
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: SizedBox(
                      width: responsive.responsiveWidth(forUnInitialDevices: 45),
                      height: responsive.responsiveHeight(forUnInitialDevices: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "02",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '32',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: ColorManager.darkGreen),
                              ),
                              Text(
                                "monday",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: '03',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: ColorManager.darkGreen),
                                  ),
                                  TextSpan(
                                    text: 'MAY',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  TextSpan(
                                    text: '2021',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 53.0),
                            child: Text(
                              '23',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ):
                  const Padding(
                    padding: EdgeInsets.only(left:10.0),
                    child: ChallengeWidget(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15,bottom: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today Tasks',style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: ColorManager.whiteColor.withOpacity(0.5),fontSize: 19)),
                  Row(
                    children: [
                      SwitchButton(
                        content: ['left', 'done'],
                        width:
                            responsive.responsiveWidth(forUnInitialDevices: 30),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Image.asset(AssetsManager.plus),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (c,index)=>TodayTaskTile(
                  index: index,
                  todayTask: true,
                  taskEntity: TaskEntity(
                    date: DateTime.now(),
                    duration: Duration(minutes: 30,seconds: 10 ),
                    id: '',
                    imageUrl: '',
                    description: 'People often overlook the power of simple walking. It increases cardiovascular and pulmonary',
                    statues: TaskStatues.done,
                    title: 'WORK TO DO'
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
