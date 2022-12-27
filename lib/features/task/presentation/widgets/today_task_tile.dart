import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nour_task/core/managers/assets_manager.dart';
import 'package:nour_task/features/task/domain/entities/task_entity.dart';
import 'package:responsive_s/responsive_s.dart';

import '../../../../core/managers/color_manager.dart';

class TodayTaskTile extends StatelessWidget {
  final TaskEntity taskEntity;
  final bool todayTask;
  final int index;

  const TodayTaskTile(
      {Key? key,
      required this.taskEntity,
      this.todayTask = false,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: responsive.responsiveWidth(forUnInitialDevices: 90),
        height: responsive.responsiveHeight(forUnInitialDevices: 15),
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
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            if(todayTask)
            Positioned(
              top: 0,
              bottom: 0,
              left: -responsive.responsiveWidth(forUnInitialDevices: 16.6),
              child: Transform.rotate(
                angle: pi / 2,
                child: Text(
                  'TODAY TASK',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: ColorManager.whiteColor.withOpacity(0.4),
                                width: 1)),
                        child: Image.asset(AssetsManager.girl)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 5, bottom: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: responsive.responsiveWidth(
                              forUnInitialDevices: 70),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                taskEntity.title,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              RichText(
                                  text: TextSpan(
                                      children: todayTask
                                          ? [
                                              TextSpan(
                                                  text:
                                                      '${taskEntity.date.day.toString().padLeft(2, '0')} ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          color: ColorManager
                                                              .darkGreen)),
                                              TextSpan(
                                                  text:
                                                      '${taskEntity.date.month} ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium),
                                              TextSpan(
                                                  text:
                                                      '${taskEntity.date.year} ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium),
                                            ]
                                          : [
                                              TextSpan(
                                                  text: 'DAY',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium),
                                              TextSpan(
                                                  text: index
                                                      .toString()
                                                      .padLeft(2, '0'),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          color: ColorManager
                                                              .darkGreen)),
                                            ])),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: responsive.responsiveWidth(forUnInitialDevices: 60),
                            child: Text(taskEntity.description,
                                style: Theme.of(context).textTheme.bodySmall)),
                        Row(

                          children: [
                            Text(taskEntity.statues.toString().replaceAll('TaskStatues.', '').toUpperCase(),
                            style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color:_choseColor(taskEntity.statues)
                            ),),
                            Padding(
                              padding:  EdgeInsets.only(left:responsive.responsiveWidth(
                                  forUnInitialDevices: 7)),
                              child: Text(todayTask?"${_calculateDuration()} MINS YOU SAVE":"DURATION ${taskEntity.duration.inHours} HOURS",
                               style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                                 color: todayTask?_choseColor(taskEntity.statues):ColorManager.blue,
                               ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Color _choseColor(TaskStatues statues){
    switch(statues){
      case TaskStatues.done:
        return ColorManager.darkGreen;
      case TaskStatues.pending:
        return ColorManager.orange;
      default:
        return ColorManager.whiteColor;

    }
  }

  String _calculateDuration(){
    return '${(taskEntity.duration.inMinutes~/60).toString().padLeft(2,'0')}:${(taskEntity.duration.inSeconds%60).toString().padLeft(2,'0')}';
  }
}
