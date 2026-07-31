import 'package:dio/dio.dart';
import 'package:news_app/models/articl_model.dart';

class NewsService {


   final Dio dio;
   NewsService(this.dio);


   Future< List<ArticlModel>> getTopHeadlines({required String category }) async{
     try {
       var response =await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=3c7bb53ff651438e9eb252f47a960856&category=$category');

       Map<String,dynamic> jsonData = response.data;
       List<dynamic> articles = jsonData['articles'] ;
       List<ArticlModel> articalist = [];
       for(var article in articles) {
         ArticlModel articlModel =
         ArticlModel(image: article['urlToImage'], title: article['title'], subtitle: article['description'],

         );
         articalist.add(articlModel);

       }
       return articalist;
     }  catch (e) {
       return [];

     }


   }

  }


