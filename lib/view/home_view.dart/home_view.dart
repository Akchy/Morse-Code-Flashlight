import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:morse_code_flashlight/functions/morse_code.dart';
import 'package:morse_code_flashlight/view/decode_view.dart/decode_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:torch_light/torch_light.dart';

class HomeView extends StatefulWidget {
  static const String route = '/';
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  double appbarHeight = AppBar().preferredSize.height;
  bool darkTheme = false;
  final inputText = TextEditingController();
  String morse = '';
  int dotTime = 200;
  int dashTime = 1000;
  int spaceTime = 500;

  @override
  void initState() {
    super.initState();
    checkSharedPref();
  }

  Future<void> checkSharedPref() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      darkTheme = prefs.getBool('darkTheme') ?? false;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _drawer(),
      body: Column(
        children: <Widget>[
          Expanded(flex: 1, child: _inputText()),
          Expanded(flex: 1, child: _flashLight()),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Morse Code'),
      centerTitle: true,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  darkTheme = !darkTheme;
                });
                final SharedPreferences prefs = await _prefs;
                await prefs.setBool('darkTheme', darkTheme);
              },
              child: Icon(
                (darkTheme)
                    ? Icons.nights_stay_outlined
                    : Icons.wb_sunny_outlined,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: SafeArea(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('Encode'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Decode'),
              onTap: () => Navigator.popAndPushNamed(context, DecodeView.route),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputText() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: inputText,
        keyboardType: TextInputType.multiline,
        minLines: 20,
        maxLines: null,
        toolbarOptions: const ToolbarOptions(
            copy: true, selectAll: true, cut: true, paste: true),
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          hintText: 'Enter Your Text Here',
          hintStyle: const TextStyle(fontSize: 13),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.5),
            borderRadius: BorderRadius.circular(3),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0.5),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }

  Widget _flashLight() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () async {
            if (inputText.text.isNotEmpty) {
              try {
                await TorchLight.isTorchAvailable();
                morse = MorseCode().encode(inputText.text.toString());
                flashlight(morse);
              } on Exception catch (_) {
                Fluttertoast.showToast(
                    msg: 'Flashlight Not Found',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    fontSize: 16.0);
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image(
                image: darkTheme
                    ? const AssetImage('assets/images/flashlight_white.png')
                    : const AssetImage('assets/images/flashlight_black.png')),
          ),
        ),
      ),
    );
  }

  void flashlight(var morse) {
    morse.split('').forEach((m) {
      if (m == '.') {
        TorchLight.enableTorch();
        sleep(Duration(milliseconds: dotTime));
        TorchLight.disableTorch();
        sleep(Duration(milliseconds: spaceTime));
      } else if (m == '_') {
        TorchLight.enableTorch();
        sleep(Duration(milliseconds: dashTime));
        TorchLight.disableTorch();
        sleep(Duration(milliseconds: spaceTime));
      } else {
        sleep(Duration(milliseconds: 3 * spaceTime));
        TorchLight.disableTorch();
      }
    });
  }
}
