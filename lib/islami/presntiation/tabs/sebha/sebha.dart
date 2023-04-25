import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../../provider/provider.dart';

class sebha extends StatefulWidget {
  const sebha({Key? key}) : super(key: key);

  @override
  State<sebha> createState() => _TasbehScreenState();
}

class _TasbehScreenState extends State<sebha> {
  int selectindex =
      0; // the first step define the counter to count all case in function
  int index = 0; // the second step define counter to count one case one case
  int alhamdulillah = -33;
  int allahakbr = -66;

  String title = 'سبحان الله ';

  void increese() {
    setState(() {
      selectindex++;
      index++;
      alhamdulillah++;
      allahakbr++;
    });
  }

  void changetitle() {
    if (selectindex >= 0 && selectindex >= 33) {
      setState(() {
        title = 'سبحان الله ';
      });
    }
    if (selectindex >= 34 && selectindex <= 66) {
      setState(() {
        title = 'الحمد لله';
        index = alhamdulillah;
      });
    }
    if (selectindex >= 67 && selectindex <= 99) {
      setState(() {
        title = 'الله اكبر';
        index = allahakbr;
      });
    }
    if (selectindex == 100) {
      index = 0;
      selectindex = 0;
      alhamdulillah = -33;
      allahakbr = -66;
    }
  }

  @override
  Widget build(BuildContext context) {
    double wightscreen = MediaQuery.of(context).size.width;
    double heightscreen = MediaQuery.of(context).size.height;
    var provider = Provider.of<AppProvider>(context);
    return Center(
      child: SizedBox(
        width: wightscreen * 0.8,
        height: heightscreen * 0.7,
        child: Column(
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                increese();
                changetitle();
              },
              child: Image.asset('assets/images/sebha_logo.png'),
            ),
            SizedBox(
              height: heightscreen * .03,
            ),
            Text(
              AppLocalizations.of(context)!.numberoftasbeh,
              style: provider.themeMode == ThemeMode.light
                  ? const TextStyle(fontSize: 25)
                  : TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(
              height: heightscreen * .02,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xffB7935F).withOpacity(0.5),
              ),
              height: 70,
              width: 50,
              child: Center(
                child: Text(
                  '$index',
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: heightscreen * .03,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xffB7935F),
              ),
              height: 50,
              width: 120,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
