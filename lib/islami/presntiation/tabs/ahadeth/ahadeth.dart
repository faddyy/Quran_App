import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:muslim/core/appcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'HadethNameItem.dart';

class Ahadeth extends StatefulWidget {
  const Ahadeth({super.key});
  static final routename = "ahadeth";
  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadethFile();
    }
    ;
    return Column(
      children: [
        Center(child: Image.asset("assets/images/ahadeth_header_bg.png")),
        Divider(
          color: AppColor.primarycolor,
          thickness: 5,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: Theme.of(context).textTheme.headline1,
        ),
        Divider(
          color: AppColor.primarycolor,
          thickness: 5,
        ),
        Expanded(
            child: allAhadeth.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return HadethNameItem(
                          allAhadeth[index].title, allAhadeth[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 2.sp,
                        color: AppColor.primarycolor,
                      );
                    },
                    itemCount: allAhadeth.length,
                  )),
      ],
    );
  }

  void loadHadethFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth .txt');

    List<String> ahadeth = content.trim().split('#\n');

    for (int i = 0; i < ahadeth.length; i++) {
      // ignore: non_constant_identifier_names
      String AllHadethContent = ahadeth[i];
      // ignore: avoid_print

      List<String> lines = AllHadethContent.split('\n');
      String title = lines[0];
      lines.removeAt(0);
      HadethModel hadethModel = HadethModel(title, lines);
      allAhadeth.add(hadethModel);
    }
    setState(() {});
  }
}

class HadethModel {
  String title;
  List<String> content;

  HadethModel(this.title, this.content);
}
