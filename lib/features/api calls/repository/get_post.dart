import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:raada_coding_test_app/features/api%20calls/model/post_model.dart';

class GetAllPostRepo extends GetConnect {
  Future<List<PostsModel>> fetchAllPost() async {
    final Response response =
        await get('https://jsonplaceholder.typicode.com/posts/');
    if (response.statusCode == 200) {
      final payLoad = List.from((response.body))
          .map((e) => PostsModel.fromJson(e))
          .toList();
      return payLoad;
    } else {
      return response.body;
    }
  }
}
