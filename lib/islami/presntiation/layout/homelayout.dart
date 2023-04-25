import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:muslim/core/appcolor.dart';
import 'package:muslim/islami/presntiation/tabs/quran/quran.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../../provider/provider.dart';
import '../tabs/ahadeth/ahadeth.dart';
import '../tabs/radio/radio.dart';
import '../tabs/sebha/sebha.dart';
import '../tabs/setting/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Homelayout extends StatefulWidget {
  const Homelayout({super.key});
  static const routeName = "Home";

  @override
  State<Homelayout> createState() => _HomelayoutState();
}

class _HomelayoutState extends State<Homelayout> {
  int currentIndex = 0;
  List<Widget> tabs = [
    quran(),
    Ahadeth(),
    sebha(),
    RadioScreen(),
    setting(),
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Stack(
      children: [
        Image.asset(
          provider.changeMainBackground(),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.helloWorld,
                style: Theme.of(context).textTheme.headline1),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Theme.of(context).primaryColor,
              ),
              child: BottomNavigationBar(
                onTap: (int index) {
                  currentIndex = index;
                  setState(() {});
                },
                currentIndex: currentIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage(
                          "assets/images/quran.png",
                        ),
                      ),
                      label: AppLocalizations.of(context)!.quran),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage(
                          "assets/images/quran-quran-svgrepo-com.png",
                        ),
                      ),
                      label: AppLocalizations.of(context)!.ahadeth),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage(
                          "assets/images/sebha.png",
                        ),
                      ),
                      label: AppLocalizations.of(context)!.tasbeh),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage(
                          "assets/images/radio.png",
                        ),
                      ),
                      label: AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings,
                  ),
                ],
              )),

          // body: tabs[currentIndex],
        ),
      ],
    );
  }
}
