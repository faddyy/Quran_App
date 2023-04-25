import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:muslim/core/appcolor.dart';
import 'package:muslim/islami/presntiation/tabs/setting/showThemeBottomSheet.dart';
import 'package:muslim/islami/presntiation/tabs/setting/show_language_bottomsheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../provider/provider.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 40, right: 40),
          child: Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () => ShowLangBottomSheet(),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.primarycolor)),
            child: Text(
              provider.AppLang == "en"
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 40),
          child: Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () => ShowThemeBottomSheet(),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColor.primarycolor)),
            child: Text(
                provider.themeMode == ThemeMode.light
                    ? AppLocalizations.of(context)!.light
                    : AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.headline1),
          ),
        ),
      ],
    );
  }

  void ShowLangBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return show_language_bottomsheet();
        });
  }

  void ShowThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return showThemeBottomSheet();
        });
  }
}
