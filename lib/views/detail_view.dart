import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipe_app/controller/bookmark_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/views/video_player_view.dart';

class DetialViewExample extends StatefulWidget {
  DetialViewExample({Key? key, required this.recipeModel}) : super(key: key);

  final RecipeModel recipeModel;
  final BookmarkController bookmarkController = BookmarkController();

  @override
  State<DetialViewExample> createState() => _DetialViewExampleState();
}

class _DetialViewExampleState extends State<DetialViewExample> {
  final BookmarkController _bookmarkController = BookmarkController();

  bool isSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.network(
              widget.recipeModel.image,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.white12,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => VideoPlayerView(
                            videoUrl: widget.recipeModel.video)));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: Icon(
                      Icons.play_arrow,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 60,
                    ),
                    radius: 40,
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color:
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.6),
                  elevation: 0,
                  margin: const EdgeInsets.all(24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        Center(
                          child: Container(
                            width: 60,
                            height: 8,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(90)),
                          ),
                        ),
                        Text(
                          widget.recipeModel.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.recipeModel.category,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.recipeModel.rate.toString(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          elevation: 0,
                          color: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.6),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 100,
                              child: ListView.separated(
                                itemCount: widget.recipeModel.ingredents.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget
                                            .recipeModel.ingredents[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        widget.recipeModel.ingredents[index]
                                            .quantity,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (_, __) {
                                  return const SizedBox(
                                    height: 5,
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.grey.shade300)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: BackButton(),
                      ),
                    ),
                    !isSuccessful
                        ? TextButton(
                            onPressed: () async {
                              bool isAdded = await _bookmarkController
                                  .createBookmark(widget.recipeModel);
                              if (isAdded) {
                                Fluttertoast.showToast(
                                    msg: "bookmarked successfully",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                setState(() {
                                  isSuccessful = true;
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: _bookmarkController.message,
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Icon(Icons.bookmark_border_outlined)),
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                        color: Colors.grey.shade300))),
                          )
                        : TextButton(
                            onPressed: () async {
                              bool isDeleted = await _bookmarkController
                                  .removeBookmark(widget.recipeModel.id);
                              if (isDeleted) {
                                Fluttertoast.showToast(
                                    msg: "bookmarked deleted",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                Navigator.pop(context);
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

                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => BookmarkView()));
                            },
                            child: const Icon(
                              CupertinoIcons.trash,
                              size: 35,
                              color: Colors.grey,
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                        color: Colors.grey.shade300))),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
