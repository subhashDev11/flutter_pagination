import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pagination_assignment/core/color_constant.dart';

class CustomTabView extends StatelessWidget {
  const CustomTabView(
      {super.key,
        required this.color,
        required this.iconSource,
        required this.title});

  final Color color;
  final String iconSource;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconSource,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                color: ColorConstant.leadCardSubTitleColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
                fontSize: 14,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        SizedBox(
          height: 10,
          child: Container(
            margin: EdgeInsets.zero,
            decoration: ShapeDecoration(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: color.withOpacity(0.5),
                  offset: const Offset(0.0, -5.0),
                  // Set a negative value for the y-coordinate
                  blurRadius: 3.0,
                ),
              ],
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
