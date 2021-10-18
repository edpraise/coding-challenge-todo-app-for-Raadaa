import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raada_coding_test_app/features/api%20calls/controller/get_post_controller.dart';

class ApiCallScreen extends StatefulWidget {
  const ApiCallScreen({Key? key}) : super(key: key);

  @override
  _ApiCallScreenState createState() => _ApiCallScreenState();
}

final getPostController = Get.put(GetAllPostController());

class _ApiCallScreenState extends State<ApiCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Data from JsonPlaceHolder',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          // elevation: 0.0,
        ),
        body: Obx(
          () => getPostController.isloading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        color: Colors.black,
                      ),
                  itemCount: getPostController.adsModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      dense: true,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(getPostController.adsModel[index].title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      subtitle: Text(getPostController.adsModel[index].body),
                    );
                  }),
        ));
  }
}
