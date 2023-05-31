import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../init/theme/custom_colors.dart';
import 'context_extensions.dart';

extension CustomAppBars on AppBar {
  static AppBar  typeBackOneAppBar(String content) => AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 4.w,
        centerTitle: false,
        title: Text(content,
            style: ThemeValueExtension.headline6
                .copyWith(color: CustomColors.primaryColor)),
      );
}
