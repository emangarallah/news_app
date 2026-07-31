import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articl_model.dart';
import 'package:news_app/views/widgets/news_title.dart';

import '../../service/news_service.dart';

class Newlistview extends StatelessWidget {
 final List<ArticlModel> articles ;
   Newlistview({super.key, required this.articles});



  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsTitle(articlModel: articles[index]),
          );
        },
        childCount: articles.length,
      ),
    );
  }
}