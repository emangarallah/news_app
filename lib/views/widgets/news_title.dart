import 'package:flutter/material.dart';

import '../../models/articl_model.dart';

// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: articleModel.image != null
              ? Image.network(
            articleModel.image!,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: const Center(
                  child: Icon(
                    Icons.broken_image,
                    size: 60,
                  ),
                ),
              );
            },
          )
              : Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: const Center(
              child: Icon(
                Icons.image_not_supported,
                size: 60,
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 12,
        ),
        Text(
          articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articleModel.subTitle ?? '',
          maxLines: 2,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        )
      ],
    );
  }
}
