import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class RecipeService {
  Future<List<dynamic>> parseJsonFromAssets(String assetsPath) async {
    return rootBundle.loadString(assetsPath).then((jsonStr) {
      return jsonDecode(jsonStr);
    });
  }
}
