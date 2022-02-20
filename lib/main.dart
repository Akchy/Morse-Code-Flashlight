import 'package:flutter/material.dart';
import 'package:morse_code_flashlight/view/home_view.dart/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var theme = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    checkSharedPref();
  }

  //Check the shared Pref for value dark theme and set the theme
  void checkSharedPref() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var dark = prefs.getBool('darkTheme') ?? false;
    setState(() {
      theme = dark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkSharedPref();
    return MaterialApp(
      title: 'Morse Code Flashlight',
      theme: ThemeData(
        // Light Theme
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        primaryColorLight: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.blue),
        highlightColor: Colors.blue[400],
      ),
      darkTheme: ThemeData(
        // Theme
        brightness: Brightness.dark,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.cyanAccent),
      ),
      themeMode: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.route,
      routes: {
        HomeView.route: (context) => const HomeView(),
      },
    );
  }
}
