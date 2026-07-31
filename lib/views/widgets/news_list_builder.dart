import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articl_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/views/widgets/newlistview.dart';

class NewesListViewBuilder extends StatefulWidget {

  const NewesListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewesListViewBuilder> createState() => _NewesListViewBuilderState();
}

class _NewesListViewBuilderState extends State<NewesListViewBuilder> {
  //late final Future<dynamic> _newsFuture;
  var future;

  @override
  void initState() {
    super.initState();
    // Fetch the news once when the widget enters the tree
    future = NewsService(Dio()).getTopHeadlines
      (category:widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticlModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Newlistview(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('Oops, there was an error loading news.'),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}