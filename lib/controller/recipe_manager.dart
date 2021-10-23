import 'package:recipe_app/service/recipe_service.dart';

class RecipeManager {
  final RecipeService _recipeService = RecipeService();
  static const String assetPath = 'assets/recipe.json';

  Future<List<dynamic>?> getRecipeData() async {
    List<dynamic>? _recipeData;

    await _recipeService.parseJsonFromAssets(assetPath).then((value) {
      _recipeData = value;
    }).catchError((onError) {
      _recipeData = [];
    });
    return _recipeData;
  }
}
