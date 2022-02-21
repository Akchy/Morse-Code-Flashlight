import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DecodeView extends StatefulWidget {
  static const String route = '/decode';
  const DecodeView({Key? key}) : super(key: key);

  @override
  _DecodeViewState createState() => _DecodeViewState();
}

class _DecodeViewState extends State<DecodeView> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  double appbarHeight = AppBar().preferredSize.height;
  bool darkTheme = false;

  var inputMorse = '';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(children: <Widget>[
        Expanded(flex: 1, child: _textOutput()),
        Expanded(flex: 1, child: _inputMorse()),
      ]),
    );
  }

  AppBar appBar() {
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

  Widget _textOutput() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        keyboardType: TextInputType.multiline,
        minLines: 20,
        maxLines: null,
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

  Widget _inputMorse() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3 * 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                    elevation: 5.0,
                    color: Colors.red,
                    onPressed: () {},
                    child: const Text(
                      '•',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                    elevation: 5.0,
                    color: Colors.red,
                    onPressed: () {},
                    child: const Text(
                      '-',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                    elevation: 5.0,
                    color: Colors.red,
                    onPressed: () {},
                    child: const Icon(
                      Icons.backspace_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(8),
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
              elevation: 5.0,
              color: Colors.red,
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
              onPressed: () {},
              child: const Text(
                'Space',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Input',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Text(
            inputMorse,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
