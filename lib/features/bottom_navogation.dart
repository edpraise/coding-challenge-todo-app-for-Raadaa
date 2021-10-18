import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raada_coding_test_app/features/screens/notes_screen.dart';

import 'api calls/screen/api_call_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final NavController navController = Get.put(NavController());
  final List<Widget> screenList = [const NotesPage(), const ApiCallScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Obx(
          () => Center(
            child: screenList.elementAt(navController.selectedIndex),
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => SizedBox(
            height: 55,
            child: BottomNavigationBar(
              elevation: 0.0,
              showUnselectedLabels: false,
              backgroundColor: Colors.blueGrey.shade700,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_comment),
                  label: 'TodoList',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_input_antenna_rounded),
                  label: 'Internet',
                ),
              ],
              currentIndex: navController.selectedIndex,
              onTap: (index) => navController.selectedIndex = index,
            ),
          )),
    );
  }
}

class NavController extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;
}
