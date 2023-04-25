import 'package:flutter/material.dart';
import 'package:muslim/provider/provider.dart';
import 'package:provider/provider.dart';

import 'app/MyApp.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (BuildContext context) {
      return AppProvider();
    },
  ));
}
