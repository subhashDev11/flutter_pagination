import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pagination_assignment/core/app_widgets/dotted_divider.dart';
import 'package:pagination_assignment/core/color_constant.dart';
import 'package:pagination_assignment/core/image_constants.dart';
import 'package:pagination_assignment/dashboard_pagination/data_model/lead_data_model/lead_data_model.dart';
import 'custom_tab_view.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final LeadDataModel item;

  String getLeadingIconSource(){
    switch((item.policyTypeDetails?.name)){
      case "Life Insurance":
        return ImageConstants.lifeInsurance;
      case "Health Insurance":
        return ImageConstants.healthInsurance;
      default:
        return ImageConstants.generalInsurance;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.transparent,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(
          15,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorConstant.leadCardPrimaryDarkColor
                                .withOpacity(0.3)),
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          getLeadingIconSource(),
                          height: 25,
                          width: 25,
                        ),
                      )),
                ),
                Expanded(
                  flex: 8,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name ?? "",
                          style: const TextStyle(
                            color: ColorConstant.leadCardTitleColor,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          item.mobile ?? "",
                          style: const TextStyle(
                            color: ColorConstant.leadCardSubTitleColor,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Current Status: ',
                                  style: TextStyle(
                                    color: ColorConstant.leadCardSubTitleColor,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: item.status ?? '',
                                  style:  TextStyle(
                                    color: Colors.green.shade600,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: DottedDivider(
                dashLength: 10,
                lineThickness: 1.6,
                dashColor: ColorConstant.leadCardSubTitleColor.withOpacity(0.6),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Expanded(
                  child: CustomTabView(
                    color: ColorConstant.leadCardPrimaryDarkColor,
                    title: "Add Comment",
                    iconSource: ImageConstants.addComment,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTabView(
                    color: ColorConstant.leadCardSecondaryDarkColor,
                    title: "Status History",
                    iconSource: ImageConstants.statusHistory,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
