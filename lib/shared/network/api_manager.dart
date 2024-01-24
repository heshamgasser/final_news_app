import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/const/app_const.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/model/sources_model.dart';


class ApiManager {

  static Future<SourcesModel> getSources ({required String category}) async{


    Uri url = Uri.https(BASEURL, sourcesEndPoint,  {
      'apiKey': APIKEY,
      'category': category,
      // 'language': languageCode
    },);
     Response response = await http.get(url);

     // to put any param in headers
     // Response response = await http.get(url, headers: {},);

     var json = jsonDecode(response.body);

     SourcesModel sourcesModel = SourcesModel.fromJson(json);
     return sourcesModel;


  }


  static Future<NewsModel> getNews (String sourceId) async{
    Uri url = Uri.https(BASEURL, headlinesEndPoint, {
      'apiKey' : APIKEY,
      'sources': sourceId
    });


    Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsModel newsModel = NewsModel.fromJson(json);

    return newsModel;
  }



}