import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipe_app/controller/bookmark_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';

//TODO: GET ALL BOOKMARKED RECIPES
//TODO: DELETE RECIPE

class BookmarkView extends StatefulWidget {
  BookmarkView({Key? key}) : super(key: key);

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  final BookmarkController bookmarkController = BookmarkController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmark',
        ),
      ),
      body: FutureBuilder(
        future: bookmarkController.getBookmarkRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          List<RecipeModel> recipeModels = snapshot.data as List<RecipeModel>;
          return ListView.builder(
              itemCount: recipeModels.length,
              itemBuilder: (BuildContext context, int index) {
                RecipeModel recipeModel = recipeModels[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: Image.network(
                      recipeModel.image,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                    title: Text(
                      recipeModel.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(recipeModel.category),
                    trailing: TextButton(
                      onPressed: () async {
                        bool isDeleted = await bookmarkController
                            .removeBookmark(recipeModel.id);
                        if (isDeleted) {
                          Fluttertoast.showToast(
                              msg: "bookmarked deleted",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          Fluttertoast.showToast(
                              msg: "OOPS!! something went wrong",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        setState(() {});
                      },
                      child: const Icon(
                        CupertinoIcons.trash,
                        size: 35,
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
