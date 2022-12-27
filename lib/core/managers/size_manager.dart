
import 'package:responsive_s/responsive_s.dart';


class FontSizeManager{

  static double smallText(context)=>Responsive(context).responsiveValue(forUnInitialDevices: 5);
  static double verySmallText(context)=>Responsive(context).responsiveValue(forUnInitialDevices: 3);
  static double bodyLarge(context)=>Responsive(context).responsiveValue(forUnInitialDevices:10);
  static double bodyMedium(context)=>Responsive(context).responsiveValue(forUnInitialDevices:6);


}