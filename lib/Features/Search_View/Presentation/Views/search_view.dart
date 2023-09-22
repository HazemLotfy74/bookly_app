import 'package:bookly/Core/Utils/styles.dart';
import 'package:flutter/material.dart';
import '../Widgets/search_field.dart';
import '../Widgets/search_result_listview.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchField(),
                SizedBox(height: 10,),
                Text("Search result",style: Styles.listTitle20,),
                Expanded(child: SearchResultListView())
              ],
            ),
          )),
    );

  }
}
