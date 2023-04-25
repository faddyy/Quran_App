import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:muslim/islami/presntiation/tabs/ahadeth/ahadeth.dart';

import 'HadethDetails.dart';

class HadethNameItem extends StatelessWidget {
  String text;
  HadethModel hadethModel;
  HadethNameItem(this.text, this.hadethModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            HadethDetails.routename,
            arguments: hadethModel,
          );
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
        ));
  }
}
