import 'package:flutter/material.dart';
import 'package:nour_task/core/managers/color_manager.dart';

class SwitchButton extends StatefulWidget {
  final List<String> content;
  final double width;

   const SwitchButton({Key? key, required this.content, required this.width}) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  double _padding = 0;
  late double _rightPadding =widget.width/widget.content.length-6;

  void _moveTo(String e){
    int index = widget.content.indexWhere((element) => element==e);
    if(index>=0){
      setState((){
        _padding = (widget.width/widget.content.length-6)*index;
        _rightPadding = (widget.width/widget.content.length-6)-_padding;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 1.5,vertical: 1.5),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.whiteColor.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            left: _padding,
           right:_rightPadding,
           top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              color:ColorManager.lightGreen ,
              ),
              width: widget.width/widget.content.length-6,
              height: 40,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.content
                .map((e) => InkWell(
              onTap: ()=>_moveTo(e),
                  child: Padding(
                        padding:const EdgeInsets.symmetric(
                          horizontal: 3,
                        ),
                        child: Text(e),
                      ),
                ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
