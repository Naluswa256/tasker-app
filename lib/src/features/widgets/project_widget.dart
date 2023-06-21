import "package:flutter/material.dart";
import 'package:avatar_stack/positions.dart';
import "package:kuunganatask/src/styles.dart";
import 'package:avatar_stack/avatar_stack.dart';
import 'package:percent_indicator/percent_indicator.dart';
class ProjectTemplate extends StatefulWidget {
  const ProjectTemplate({super.key});

  @override
  State<ProjectTemplate> createState() => _ProjectTemplateState();
}

class _ProjectTemplateState extends State<ProjectTemplate> {
  final settings = RestrictedAmountPositions(
      maxAmountItems: 4,
      maxCoverage: 0.7,
      minCoverage: 0.3,

    );
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 148,
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppStyles.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              'Mane Uikit',
              style: TextStyle(
                  color: AppStyles.neutralDark,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            SizedBox(
              height: 35,
              width: 120,
              child: AvatarStack(
                settings: settings,
                height: 35,
                borderColor: Colors.transparent,
                infoWidgetBuilder: (surplus) => _infoWidget(surplus, context),
                avatars: [
                  for (var n = 0; n < 15; n++) NetworkImage(getAvatarUrl(n))
                ],
              ),
            )
          ]),

          const SizedBox(height: 16),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            AppStyles.calendar,
            // const SizedBox(width:8),
            const Text(
              '01/01/2021',
              style: TextStyle(
                  color: AppStyles.paleDark,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),

            // const SizedBox(width:12),

            Image.asset('assets/images/arrow.png', width: 59, height: 14),
            // const SizedBox(width:10),

            // const SizedBox(width:12),
            AppStyles.calendarPrimary,
            // const SizedBox(width:8),
            const Text(
              '01/01/2021',
              style: TextStyle(
                  color: AppStyles.primary,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
          ]),

          const SizedBox(height: 16),

          Row(children: [
            Expanded(
              child: LinearPercentIndicator(
                // width: 167,
                lineHeight: 8.0,
                percent: 0.5,
                progressColor: AppStyles.primary,
                backgroundColor: AppStyles.neutralLight,
                barRadius: const Radius.circular(8),
                leading: const Text(
                  '50%',
                  style: TextStyle(
                      color: AppStyles.neutralDark,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text.rich(
              TextSpan(
                text: '24',
                style: TextStyle(
                    color: AppStyles.paleDark,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
                children: [
                  TextSpan(
                    text: '/48',
                    style: TextStyle(
                        color: AppStyles.neutralDark,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ],
              ),
            )
          ]), //end of row indicator
        ]));
  }


   String getAvatarUrl(int n) {
  final url = 'https://i.pravatar.cc/150?img=$n';
  // final url = 'https://robohash.org/$n?bgset=bg1';
  return url;
}

Widget _infoWidget(int surplus, BuildContext context) {
    return Container(
  width: 28,
  height: 28,
  padding:EdgeInsets.zero,
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: AppStyles.ascent,
  ),
  child:Center(child:Text(
          '+$surplus',
          style:const  TextStyle(
                          color: AppStyles.whiteColor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
        ),)
);

  }
}
