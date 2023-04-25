import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:muslim/islami/presntiation/tabs/sura/suradetailsargs.dart';

class quransuraitem extends StatelessWidget {
  quransuraitem(this.text, this.index, {super.key});
  String text;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          suradetailsargs.routeName,
          arguments: SuraDetailsArgs(text, index),
        );
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
