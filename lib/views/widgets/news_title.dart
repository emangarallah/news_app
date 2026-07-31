

import 'package:flutter/material.dart';
import 'package:news_app/models/articl_model.dart';

class NewsTitle extends StatelessWidget {
  const NewsTitle({super.key, required this.articlModel});
  final ArticlModel articlModel;

  @override
  Widget build(BuildContext context) {
    return

      Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(6),

          child: Image.network(  articlModel.image ?? "https://via.placeholder.com/300",height:300,
            width: double.infinity,


            fit: BoxFit.cover,
          ),



        ),

        const SizedBox(height: 12),
        Text(articlModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,


        ),
        ),
        const SizedBox(height: 8),
        Text(articlModel.subtitle ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,


          ),
        ),




      ],
    );
  }
}
