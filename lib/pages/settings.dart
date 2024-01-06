import 'package:flutter/material.dart';
import 'package:hisaab/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import '../app_bar.dart';
import '../bottom_bar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MyAppBar(),
        body: Container(),
        bottomNavigationBar: BottomBar(),
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

