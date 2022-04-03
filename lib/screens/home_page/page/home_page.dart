import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/services/firebase_notification.dart';
import 'package:todo_app/core/utils/size_config.dart';
import 'package:todo_app/screens/home_page/page/components/notification_adding_page.dart';
import 'package:todo_app/screens/notifications_list_page/notifications_list_page.dart';
import 'package:todo_app/screens/provider/category_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _pages = [
    const NotificaitonAddingPage(),
    const NotificationsListPage()
  ];

  @override
  void initState() {
    FirebaseNotification.listenNotificaiton(context);
    FirebaseNotification.onTapListening(context);
    FirebaseNotification.onTapWhileterminated(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: _myAppBar(),
      body: _pages[context.watch<PageProvider>().pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<PageProvider>().pageIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          context.read<PageProvider>().changePage(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: "",
          ),
        ],
      ),
    );
  }

  _myAppBar() => AppBar(
        toolbarHeight: getHeight(90),
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Hello Lazizbek!",
              style: TextStyle(fontSize: Constants.h2),
            ),
            Text(
              "Have a nice day!",
              style: TextStyle(fontSize: Constants.h2),
            )
          ],
        ),
      );
}
