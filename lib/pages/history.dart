import 'package:flutter/material.dart';
import 'package:hisaab/models/money.dart';
import 'package:hisaab/models/money_database.dart';
import 'package:hisaab/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import '../app_bar.dart';
import '../bottom_bar.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  @override
  Widget build(BuildContext context) {
    
    final moneyDatabase = context.watch<MoneyDatabase>();
    List<Money> currentMoney = moneyDatabase.currentMoney;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const MyAppBar(),
        body:  ListView.builder(
                itemCount: currentMoney.length,
                itemBuilder: (context, index){
                  final money = currentMoney[index];
                  return Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.primary
                    ),
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    
                    child: Center(
                        child: ListTile(
                          textColor: Theme.of(context).colorScheme.inversePrimary,
                          iconColor: Theme.of(context).colorScheme.inversePrimary,
                          title: Row(children: [
                            const Icon(Icons.currency_rupee),
                            
                            Text(money.ammount.toString())
                          ]),
                          trailing: Text(money.date.toString()),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                    
                  );
                },
              ),
        bottomNavigationBar: const BottomBar(),
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}