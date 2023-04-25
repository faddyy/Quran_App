import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:muslim/islami/presntiation/tabs/sura/suradetailsargs.dart';
import 'package:muslim/islami/presntiation/tabs/sura/suragetails.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import '../../../../core/appcolor.dart';
import '../../../../provider/provider.dart';
import 'suradetailsargs.dart';

class suradetailsargs extends StatefulWidget {
  suradetailsargs({super.key});
  static const routeName = "sura detail";

  @override
  State<suradetailsargs> createState() => _suradetailsargsState();
}

class _suradetailsargsState extends State<suradetailsargs> {
  var SuraDetailsArgs;
  List<String> verses = [];
  void loadfile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    verses = content.split("\n");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    SuraDetailsArgs = ModalRoute.of(context)?.settings.arguments;
    if (verses.isEmpty) {
      loadfile(SuraDetailsArgs.index);
    }
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
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              SuraDetailsArgs.suraname,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 85,
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 50,
                            ),
                            color: Theme.of(context).primaryColor,
                            height: 1,
                          );
                        },
                        itemCount: verses.length,
                        itemBuilder: (context, index) {
                          return SuraDetailsItem(
                            verses[index].toString(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}

class SuraDetailsArgs {
  String suraname;
  int index;
  SuraDetailsArgs(this.suraname, this.index);
}
