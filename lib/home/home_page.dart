import 'package:country_search/services/rest_countries.dart';
import 'package:country_search/home/widgets/country_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> countryInfo = [];

  void _restCountriesSetup() async {
    RestCountries instance = RestCountries();
    await instance.getCountries();

    setState(() {
      countryInfo = instance.countries;
    });
  }

  @override
  void initState() {
    _restCountriesSetup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f6fa),
      appBar: AppBar(
        title: Text("Países"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
              },
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: countryInfo.length,
          itemBuilder: (context, index) {
            return CountryCard(
              country: countryInfo[index],
            );
          },
        )
      ),
    );
  }
}
