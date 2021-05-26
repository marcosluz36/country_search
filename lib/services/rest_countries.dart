import 'package:dio/dio.dart';
import 'package:diacritic/diacritic.dart';

class RestCountries {
  bool _hasInfo = false;
  List<Map<String, String>> _allCountries = [];
  List<Map<String, String>> _filteredCountries = [];

  bool get hasInfo => _hasInfo;
  List<Map<String, String>> get countries => _filteredCountries;

  void _countriesAccepted(dynamic data) {
    if (data["translations"]["br"].length < 13 && data["currencies"][0]["code"] != null) {
      _allCountries.add({
        "flag": "https://flagcdn.com/w320/${data["alpha2Code"].toLowerCase()}.png",
        "name": data["translations"]["br"],
        "region": data["region"],
        "initials": data["alpha2Code"],
        "currency": data["currencies"][0]["code"]
      });
    }
  }

  Future<void> getAllCountries() async {
    try {
      Response response = await Dio().get("https://restcountries.eu/rest/v2/all");

      for (int x = 0; x < response.data.length; x++) {
        _countriesAccepted(response.data[x]);
      }

      _allCountries.sort((countryA, countryB) {
        String countryAName = removeDiacritics(countryA["name"]);
        String countryBName = removeDiacritics(countryB["name"]);
        return countryAName.compareTo(countryBName);
      });

      _filteredCountries = _allCountries;
      _hasInfo = true;

    } catch(error) {
      print(error);
    }
  }

  void filterCountries(List<String> filter) {
    if (filter.length == 1) {
      _filteredCountries = _allCountries;
    }

    else {
      _filteredCountries = _allCountries.where((country) => country[filter[0]].toLowerCase().startsWith(filter[1])).toList();
    }
  }
}