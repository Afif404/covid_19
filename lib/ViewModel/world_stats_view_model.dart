import 'dart:convert';
import 'package:covid_19/ViewModel/Utilities/app_url.dart';
import 'package:covid_19/models/world_stats_class.dart';
import 'package:http/http.dart' as http;
import 'package:covid_19/models/countries_list_models.dart';

class WorldStatsViewModel {
  // Fetch world statistics
  Future<WorldStatsClass> fetchWorldRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatsApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatsClass.fromJson(data);
    } else {
      throw Exception('Error fetching world stats: ${response.statusCode}');
    }
  }

  // Fetch countries list
  Future<List<dynamic>> countriesListApi() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('Error fetching countries list: ${response.statusCode}');
    }
  }
}
