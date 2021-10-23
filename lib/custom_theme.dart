import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// light theme
ThemeData customLightTheme(
  BuildContext context,
) {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: Theme.of(context).colorScheme.copyWith(
            background: Colors.orange,
            secondary: Colors.orange,
            primary: Colors.orange,
            brightness: Brightness.light,
          ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.orange),
      errorColor: const Color(0x00b00020),
      platform: defaultTargetPlatform,
      highlightColor: Colors.pink.withOpacity(.5),
      primaryColor: Colors.white,
      indicatorColor: Colors.orange,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.pink),
      unselectedWidgetColor: Colors.grey,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.dmSans().fontFamily,
      cardColor: const Color.fromRGBO(250, 250, 250, 1),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        alignLabelWithHint: true,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        contentPadding: const EdgeInsets.all(15.0),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: .5),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: .5),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00E5E5E5)),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: const Color(0x00b00020).withOpacity(.5), width: .5),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            )),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00b00020), width: .5),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        labelStyle: Theme.of(context).textTheme.bodyText2,
        errorStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: const Color(0x00b00020)),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.black.withOpacity(.5),
      ),
      textTheme: Typography.material2018(platform: defaultTargetPlatform)
          .white
          .copyWith(
            bodyText1: const TextStyle(color: Colors.black),
            bodyText2: const TextStyle(color: Colors.black),
            caption: const TextStyle(color: Colors.black),
            headline1: const TextStyle(color: Colors.black),
            headline2: const TextStyle(color: Colors.black),
            headline3: const TextStyle(color: Colors.black),
            headline4: const TextStyle(color: Colors.black),
            headline5: const TextStyle(color: Colors.black),
            headline6: const TextStyle(color: Colors.black),
            subtitle1: const TextStyle(color: Colors.black),
            subtitle2: const TextStyle(color: Colors.black),
            overline: const TextStyle(color: Colors.black),
            button: const TextStyle(color: Colors.black),
          ),
      dividerColor: Colors.grey,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.pink),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22)));
}

///dark theme
ThemeData customDarkTheme(
  BuildContext context,
) {
  return ThemeData(
      scaffoldBackgroundColor: const Color(0xFF121212),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: Theme.of(context).colorScheme.copyWith(
            background: Colors.orange,
            secondary: Colors.orange,
            primary: Colors.orange,
            brightness: Brightness.dark,
          ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.orange),
      errorColor: const Color(0x00CF6679),
      primaryColor: const Color(0x00121212),
      indicatorColor: Colors.orange,
      highlightColor: Colors.pink.withOpacity(.5),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.pink),
      platform: defaultTargetPlatform,
      unselectedWidgetColor: Colors.grey,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.openSans().fontFamily,
      cardColor: const Color.fromRGBO(31, 31, 31, 1),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.white.withOpacity(.7),
      ),
      textTheme: Typography.material2018(platform: defaultTargetPlatform)
          .white
          .copyWith(
            bodyText1: const TextStyle(color: Colors.white),
            bodyText2: const TextStyle(color: Colors.white),
            caption: const TextStyle(color: Colors.white),
            headline1: const TextStyle(color: Colors.white),
            headline2: const TextStyle(color: Colors.white),
            headline3: const TextStyle(color: Colors.white),
            headline4: const TextStyle(color: Colors.white),
            headline5: const TextStyle(color: Colors.white),
            headline6: const TextStyle(color: Colors.white),
            subtitle1: const TextStyle(color: Colors.white),
            subtitle2: const TextStyle(color: Colors.white),
            overline: const TextStyle(color: Colors.white),
            button: const TextStyle(color: Colors.white),
          ),
      iconTheme: const IconThemeData(color: Colors.white),
      dividerColor: Colors.white.withOpacity(.6),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color.fromRGBO(31, 31, 31, 1),
        filled: true,
        alignLabelWithHint: true,
        hintStyle: Theme.of(context).textTheme.bodyText1,
        contentPadding: const EdgeInsets.all(15.0),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00E5E5E5)),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: const Color(0x00CF6679).withOpacity(.5), width: .5),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x00CF6679), width: .5),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        labelStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: Colors.white),
        errorStyle: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: const Color(0x00CF6679)),
      ),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          color: Color(0x00121212),
          iconTheme: IconThemeData(color: Colors.pink),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22)));
}
