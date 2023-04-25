import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:muslim/core/appcolor.dart';
import 'package:muslim/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class show_language_bottomsheet extends StatefulWidget {
  const show_language_bottomsheet({super.key});

  @override
  State<show_language_bottomsheet> createState() =>
      _show_language_bottomsheetState();
}

class _show_language_bottomsheetState extends State<show_language_bottomsheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.ChangeAppLanguage("en");
            },
            child: selectedlang(AppLocalizations.of(context)!.english,
                provider.AppLang == "en" ? true : false),
          ),
          InkWell(
            onTap: () {
              provider.ChangeAppLanguage("ar");
            },
            child: selectedlang(AppLocalizations.of(context)!.arabic,
                provider.AppLang == "ar" ? true : false),
          )
        ],
      ),
    );
  }

  Widget selectedlang(String text, bool select) {
    if (select) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: AppColor.primarycolor, fontSize: 25.sp),
          ),
          Icon(
            Icons.check,
            size: 30,
            color: AppColor.primarycolor,
          )
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
          Icon(
            Icons.check,
            size: 30,
          )
        ],
      );
    }
  }
}
