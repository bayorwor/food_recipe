import 'package:flutter/cupertino.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/service/bookmark_recipe.dart';

class BookmarkController with ChangeNotifier {
  String _message = "";

  get message => _message;

  setMessage(String message) {
    _message = message;
    notifyListeners();
  }

  final BookmarkService _bookmarkService = BookmarkService();

  Future<List<RecipeModel>> getBookmarkRecipes() async {
    try {
      await _bookmarkService.open();
      var bookMarkData = await _bookmarkService.getAllRecipe();
      if (bookMarkData != null) {
        await _bookmarkService.close();
        return bookMarkData;
      }
    } catch (error) {
      setMessage("$error");
    }
    await _bookmarkService.close();
    return [];
  }

  Future<bool> createBookmark(RecipeModel recipeModel) async {
    bool isAdded = false;
    try {
      await _bookmarkService.open();
      _bookmarkService.insert(recipeModel);
      await getBookmarkRecipes();
      await _bookmarkService.close();
      isAdded = true;
    } catch (error) {
      setMessage("$error");
      isAdded = false;
    }
    return isAdded;
  }

  Future<bool> removeBookmark(int id) async {
    bool isDeleted = false;
    try {
      await _bookmarkService.open();
      _bookmarkService.delete(id);
      await getBookmarkRecipes();
      await _bookmarkService.close();
      isDeleted = true;
    } catch (error) {
      setMessage("$error");
      isDeleted = false;
    }
    return isDeleted;
  }
}
