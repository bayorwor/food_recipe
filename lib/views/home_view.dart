import 'package:flutter/material.dart';
import 'package:recipe_app/controller/recipe_manager.dart';
import 'package:recipe_app/model/recipe_model.dart' as recipe_model;
import 'package:recipe_app/views/bookmark_view.dart';
import 'package:recipe_app/views/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final PageController _pageController =
      PageController(viewportFraction: 0.9, initialPage: 0);
  final RecipeManager _recipeManager = RecipeManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.menu),
                  ),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.grey.shade300))),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.notifications_none_outlined),
                  ),
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.grey.shade300))),
                )
              ],
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      drawer: const Drawer(),
      body: IndexedStack(
        children: [
          HomeRecipes(
              recipeManager: _recipeManager, pageController: _pageController),
          BookmarkView()
        ],
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: _currentIndex,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_outlined), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined), label: 'Notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Account')
        ],
      ),
    );
  }
}

//home view widget extracted
class HomeRecipes extends StatelessWidget {
  const HomeRecipes({
    Key? key,
    required RecipeManager recipeManager,
    required PageController pageController,
  })  : _recipeManager = recipeManager,
        _pageController = pageController,
        super(key: key);

  final RecipeManager _recipeManager;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Recipes',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w600)),
            TextSpan(
                text: '.',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.orange))
          ]),
        ),
        Text(
          'An curated list of awesome recipes',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.grey),
        ),
        const SizedBox(
          height: 25,
        ),
        TextFormField(
          style: Theme.of(context).textTheme.bodyText1,
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          maxLines: 1,
          enableInteractiveSelection: true,
          decoration: InputDecoration(
              labelText: 'Search',
              alignLabelWithHint: true,
              hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
              contentPadding: const EdgeInsets.all(20.0),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              focusedBorder:
                  Theme.of(context).inputDecorationTheme.focusedBorder,
              enabledBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
              disabledBorder:
                  Theme.of(context).inputDecorationTheme.disabledBorder,
              errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
              focusedErrorBorder:
                  Theme.of(context).inputDecorationTheme.focusedErrorBorder,
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              filled: true,
              labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
              errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
              prefixIcon: const Icon(Icons.search)),
        ),
        const SizedBox(
          height: 15,
        ),
        FutureBuilder<List<dynamic>?>(
            future: _recipeManager.getRecipeData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  snapshot.data == null) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.height,
                child: PageView.builder(
                  pageSnapping: true,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    recipe_model.RecipeModel model =
                        recipe_model.RecipeModel.fromJson(
                            snapshot.data![index]);

                    return GestureDetector(
                      onTap: () {
                        //TODO: PASS RECIPE DATA TO DETAILS VIEW
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetialViewExample(
                                  recipeModel: model,
                                )));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(model.image),
                                fit: BoxFit.cover)),
                        child: Column(
                          children: [
                            const Spacer(),
                            Card(
                              color: Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(.9),
                              elevation: 0,
                              margin: const EdgeInsets.all(24),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //TODO: PASS THE RIGHT TITLE DATA TO TEXT WIDGET
                                        Text(
                                          snapshot.data![index]["title"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          model.category,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          '${model.rate}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot
                      .data!.length, //TODO: PASS THE RIGHT LENGTH TO ITEM COUNT
                ),
              );
            })
      ],
    );
  }
}
