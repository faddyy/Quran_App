import 'package:flutter/material.dart';
import 'package:muslim/core/My_Theme.dart';
import 'package:muslim/islami/presntiation/tabs/ahadeth/HadethDetails.dart';
import 'package:muslim/islami/presntiation/tabs/quran/quran.dart';
import 'package:muslim/islami/presntiation/tabs/sura/suradetailsargs.dart';
import 'package:muslim/islami/presntiation/tabs/sura/suragetails.dart';
import '../islami/presntiation/layout/homelayout.dart';
import 'package:sizer/sizer.dart';
import '../islami/presntiation/tabs/ahadeth/ahadeth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, Orientation, DeviceType) {
      var provider = Provider.of<AppProvider>(context);

      return MaterialApp(
        title: 'Localizations Sample App',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Spanish
        ],
        locale: Locale(provider.AppLang),
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightmode,
        darkTheme: MyTheme.darkmode,
        themeMode: provider.themeMode,
        initialRoute: Homelayout.routeName,
        routes: {
          Homelayout.routeName: (c) => const Homelayout(),
          quran.routeName: (c) => quran(),
          suradetailsargs.routeName: (c) => suradetailsargs(),
          Ahadeth.routename: (c) => Ahadeth(),
          HadethDetails.routename: (c) => HadethDetails(),
        },
      );
    });
  }
}
