import 'dart:convert';

import 'package:path/path.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:sqflite/sqflite.dart';

class BookmarkService {
  late Database db;

  final String tableRecipe = 'recipe_db';
  String columnId = 'id';
  String columnTitle = 'title';
  String columnCategory = 'category';
  String columnRate = 'rate';
  String columnImage = 'image';
  String columnVideo = 'video';
  String columnIngredents = 'ingredents';

  Future open() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'myrecipedb.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableRecipe ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnCategory text not null,
  $columnRate double not null,
  $columnImage text not null,
  $columnVideo text not null,
  $columnIngredents array not null)
''');
    });
  }

  Future<RecipeModel> insert(RecipeModel recipeModel) async {
    recipeModel.id = await db.insert(tableRecipe, recipeModel.toJson());
    return recipeModel;
  }

  Future<List<RecipeModel>?> getAllRecipe() async {
    List<Map<String, dynamic>> maps = await db.query(tableRecipe, columns: [
      columnId,
      columnCategory,
      columnImage,
      columnIngredents,
      columnRate,
      columnVideo,
      columnTitle
    ]);
    if (maps.isNotEmpty) {
      return recipeModelFromJson(jsonEncode(maps));
    }
    return null;
  }

  Future<RecipeModel?> getRecipe(int id) async {
    List<Map<String, dynamic>> maps = await db.query(tableRecipe,
        columns: [
          columnId,
          columnCategory,
          columnImage,
          columnIngredents,
          columnRate,
          columnVideo,
          columnTitle
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return RecipeModel.fromJson(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db
        .delete(tableRecipe, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(RecipeModel recipeModel) async {
    return await db.update(tableRecipe, recipeModel.toJson(),
        where: '$columnId = ?', whereArgs: [recipeModel.id]);
  }

  Future close() async => db.close();
}
