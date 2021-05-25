import 'package:country_search/home/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CountrySearch",
      home: HomePage(),
    );
  }
}
