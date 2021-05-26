import 'package:country_search/home/widgets/dialog_filter.dart';
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
  RestCountries _restCountries = RestCountries();

  void _restCountriesSetup() async {
    await _restCountries.getAllCountries();
    setState(() {
      countryInfo = _restCountries.countries;
    });
  }

  void _filterCountryInfo(List<String> filter) {
    _restCountries.filterCountries(filter);
    setState(() {
      countryInfo = _restCountries.countries;
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
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            padding: const EdgeInsets.only(right: 10.0),
            onPressed: () {
              showDialog(context: context, builder: (BuildContext context) {
                return DialogFilter(
                  onSubmit: _filterCountryInfo,
                );
              });
            }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 15.0,
        ),
        child: widgetCondition()
      ),
    );
  }
}
