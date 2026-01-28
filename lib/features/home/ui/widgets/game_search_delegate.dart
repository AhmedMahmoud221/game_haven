import 'package:flutter/material.dart';
import 'package:game_haven/core/theming/colors.dart';
import 'package:game_haven/core/theming/styles.dart';

class GameSearchDelegate extends SearchDelegate {
  
  // تغيير شكل الـ Theme بتاع شاشة البحث عشان يليق على الأبلكيشن
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: ColorsManager.mainBackground),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white), // لون نص البحث
      ),
    );
  }

  // الأيقونة اللي في الآخر (X لتمسح الكلام)
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: Colors.white),
        onPressed: () {
          query = ''; // تمسح النص المكتوب
        },
      ),
    ];
  }

  // الأيقونة اللي في الأول (سهم الرجوع)
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: ColorsManager.mainPurple),
      onPressed: () {
        close(context, null); // يقفل شاشة البحث
      },
    );
  }

  // النتائج اللي بتظهر لما يدوس Search
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: ColorsManager.mainBackground,
      child: Center(
        child: Text('Results for "$query"', style: TextStyles.font18WhiteMedium),
      ),
    );
  }

  // الاقتراحات اللي بتظهر وهو بيكتب
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: ColorsManager.mainBackground,
      child: const Center(
        child: Text('Search for your favorite games...', style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}