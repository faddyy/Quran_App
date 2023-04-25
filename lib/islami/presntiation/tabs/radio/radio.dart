import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:muslim/core/appcolor.dart';
import 'package:provider/provider.dart';
import '../../../../provider/provider.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Image.asset('assets/images/radio_logo.png'),
        const SizedBox(
          height: 100,
        ),
        Text(
          AppLocalizations.of(context)!.holyquranradio,
          style: provider.themeMode == ThemeMode.light
              ? const TextStyle(fontSize: 25)
              : TextStyle(fontSize: 25, color: Colors.white),
        ),
        const SizedBox(
          height: 100,
        ),
        SizedBox(
          width: 280,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageIcon(
                const AssetImage(
                  'assets/images/play.png',
                ),
                size: 280,
                color: AppColor.primarycolor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
