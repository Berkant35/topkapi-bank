

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/extension/context_extensions.dart';
import '../constants/extension/edge_extension.dart';
import '../init/theme/custom_colors.dart';

class BackTypeOne extends ConsumerWidget {
  final Widget contentWidget;
  const BackTypeOne({
    Key? key,
    required this.contentWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          color: CustomColors.primaryColor,
          width: 100.w,
          height: 100.h,
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              Text("Topkapı Bank",style: ThemeValueExtension.headline6.copyWith(
                  color: CustomColors.backgroundColor
              ),),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 100.w,
            height: 80.h,
            decoration: BoxDecoration(
                color: CustomColors.backgroundColor,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(EdgeExtension.hugeEdge.edgeValue))),
            child: Padding(
              padding: EdgeInsets.all(EdgeExtension.highEdge.edgeValue),
              child: contentWidget,
            ),
          ),
        )
      ],
    );
  }
}
