

import 'package:flutter/material.dart';
import 'package:responsive_s/responsive_s.dart';

import '../../../features/task/presentation/widgets/fehrenhite_widget.dart';
import '../../managers/assets_manager.dart';
import '../../managers/color_manager.dart';
import '../../managers/size_manager.dart';

AppBar buildAppBar(BuildContext context){
  final Responsive responsive = Responsive(context);
  return AppBar(
    leadingWidth: responsive.responsiveValue(forUnInitialDevices: 17),
    leading: Row(
      children: [
        Image.asset(AssetsManager.cloud,),
        const FehrenhiteWidget(temperature: '36',),
      ],
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AssetsManager.sunup),
            Text("06:30AM",style: TextStyle(
                fontSize: FontSizeManager.verySmallText(context)
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Container(
                width: 1.5,height: 10,
                color: ColorManager.whiteColor.withOpacity(0.3),
              ),
            ),
            Image.asset(AssetsManager.sundown),
            Text("06:30AM",style: TextStyle(
                fontSize: FontSizeManager.verySmallText(context)
            ),),
          ],
        ),
        RichText(text: TextSpan(
            children: [
              TextSpan(
                  text: 'Lucknow,',
                  style: TextStyle(
                      color: ColorManager.darkGreen,
                      fontSize: FontSizeManager.verySmallText(context)
                  )
              ),
              TextSpan(
                  text: 'Uttar Pradesh',
                  style: TextStyle(
                      fontSize: FontSizeManager.verySmallText(context)
                  )
              ),
            ]
        ))
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10,left: 10),
        child: Image.asset(AssetsManager.ranking,
          height:responsive.responsiveWidth(forUnInitialDevices:5.5 ) ,
          width:responsive.responsiveWidth(forUnInitialDevices:5.5 ) ,),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10,left: 10),
        child: Image.asset(AssetsManager.calender,
          height:responsive.responsiveWidth(forUnInitialDevices:5.5 ) ,
          width:responsive.responsiveWidth(forUnInitialDevices:5.5 ) ,),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10,left: 10),
        child: Image.asset(AssetsManager.chart,
          height:responsive.responsiveWidth(forUnInitialDevices:5.5 ) ,
          width:responsive.responsiveWidth(forUnInitialDevices:5.5 ) ,
        ),
      ),
    ],
  );
}