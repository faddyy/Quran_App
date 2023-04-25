import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:muslim/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../core/appcolor.dart';

class showThemeBottomSheet extends StatefulWidget {
  const showThemeBottomSheet({super.key});

  @override
  State<showThemeBottomSheet> createState() => _showThemeBottomSheetState();
}

class _showThemeBottomSheetState extends State<showThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            onTap: () {
              provider.ChangeAppTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: SelectedTheme(AppLocalizations.of(context)!.light,
                provider.themeMode == ThemeMode.light ? true : false),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            onTap: () {
              provider.ChangeAppTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: SelectedTheme(AppLocalizations.of(context)!.dark,
                provider.themeMode == ThemeMode.dark ? true : false),
          ),
        )
      ],
    );
  }

  Widget SelectedTheme(String text, bool select) {
    if (select) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              text,
              style: TextStyle(color: AppColor.primarycolor, fontSize: 25.sp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.check,
              size: 20.sp,
              color: AppColor.primarycolor,
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.check,
              size: 20.sp,
            ),
          ),
        ],
      );
    }
  }
}
