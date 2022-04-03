import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/hive/hive_init.dart';
import 'package:todo_app/core/services/firebase_notification.dart';
import 'package:todo_app/core/utils/main_theme.dart';
import 'package:todo_app/core/utils/routers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:todo_app/screens/provider/category_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  tz.initializeTimeZones();
  await HiveData.init();
  await FirebaseNotification.initFirebaseMessaging();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RouteGenerator _router = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PageProvider())],
      child: MaterialApp(
        title: 'Firebase Notification App',
        debugShowCheckedModeBanner: false,
        theme: MainTheme.light,
        initialRoute: "/home",
        onGenerateRoute: _router.routeGenerate,
      ),
    );
  }
}
