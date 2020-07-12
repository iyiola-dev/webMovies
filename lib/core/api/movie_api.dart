import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:landing_page/core/api/api_url.dart';
import 'package:landing_page/core/models/movies_models.dart';

class Api {
  static Future<Movies> getMovies(context) async {
    try {
      var response = await http.get(
          'https://api.themoviedb.org/3/trending/all/day?api_key=ad877cff8347b52d4a2c410a0cfb9982');
      print(response.body);
      if (response.body != null && response.statusCode == 200) {
        return Movies.fromJson(json.decode(response.body));
      } else {
        print('failed');
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
