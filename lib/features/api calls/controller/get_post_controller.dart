import 'package:get/get.dart';
import 'package:raada_coding_test_app/features/api%20calls/model/post_model.dart';
import 'package:raada_coding_test_app/features/api%20calls/repository/get_post.dart';

class GetAllPostController extends GetxController {
  final getPostRepo = GetAllPostRepo();
  RxList<PostsModel> adsModel = RxList<PostsModel>([]);
  RxBool isloading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getAllPosts();
  }

  Future<dynamic> getAllPosts() async {
    try {
      isloading(true);
      var data = await getPostRepo.fetchAllPost();
      adsModel.value = data;
      isloading(false);
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
