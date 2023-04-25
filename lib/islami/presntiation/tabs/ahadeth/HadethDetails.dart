import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:muslim/core/appcolor.dart';
import 'package:muslim/islami/presntiation/tabs/ahadeth/ahadeth.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../provider/provider.dart';
import 'HadethDetailsItem.dart';

class HadethDetails extends StatelessWidget {
  HadethDetails({super.key});
  static const String routename = "hadethdetails";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    HadethModel model =
        ModalRoute.of(context)!.settings.arguments as HadethModel;
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
            centerTitle: true,
            title: Text(
              model.title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 85,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return HadethDetailsItem(
                      model.content[index].toString(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      color: Theme.of(context).primaryColor,
                      height: 1,
                    );
                  },
                  itemCount: model.content.length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
