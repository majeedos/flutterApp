



import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget{
  Widget? title;
  Widget? subTitle;
  Widget? leading;
  Widget? tail;
  double? gap;
  AlignmentGeometry? titlesAlignment;
  AlignmentGeometry? tailAlignment;
  double height;

   CustomListTile({required this.height,  this.title,  this.subTitle,  this.leading,  this.tail, this.gap, this.tailAlignment=Alignment.bottomLeft, this.titlesAlignment = Alignment.topLeft,   super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
        children: [
          Container(
            height: height,
            width: height,
            child: leading?? Container(),
          ),
          SizedBox(
            width: gap,
          ),
          Flexible(

            child: Container(
              height: height,
              child: Stack(
                fit : StackFit.expand,
                children: [
                  Align(
                      alignment:    titlesAlignment!,

                    child: Column(
                      mainAxisSize : MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title?? Container(),
                        SizedBox(height: 5.0),
                        subTitle?? Container(),
                      ],
                    )
                  ),

                  Align(
                    alignment: tailAlignment!,
                    child: tail?? Container(),
                  ),

                ],
              ),
            ),
          )
        ],

    );



  }




}