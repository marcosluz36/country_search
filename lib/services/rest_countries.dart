import 'package:dio/dio.dart';
import 'package:diacritic/diacritic.dart';

class RestCountries {
  List<Map<String, String>> _countries = [];

  List<Map<String, String>> get countries => _countries;

  Future<void> getCountries() async {
    Response response = await Dio().get("https://restcountries.eu/rest/v2/all");

    for (int x = 0; x < response.data.length; x++) {
      _filterCountries(response.data[x]);
    }

    _countries.sort((countryA, countryB) {
      String countryAName = removeDiacritics(countryA["name"]);
      String countryBName = removeDiacritics(countryB["name"]);
      return countryAName.compareTo(countryBName);
    });
  }

  void _filterCountries(dynamic data) {
    if (data["translations"]["br"].length < 13 && data["currencies"].length > 0) {
      _countries.add({
        "flag": "https://flagcdn.com/w320/${data["alpha2Code"].toLowerCase()}.png",
        "name": data["translations"]["br"],
        "region": data["region"],
        "initials": data["alpha2Code"],
        "currency": data["currencies"][0]["code"]
      });
    }
  }
}