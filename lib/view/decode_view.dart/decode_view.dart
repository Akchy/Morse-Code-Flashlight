import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:morse_code_flashlight/functions/morse_code.dart';
import 'package:morse_code_flashlight/view/home_view.dart/home_view.dart';
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
  String morse = '';

  String inputMorse = '';
  String output = '';
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
      drawer: _drawer(),
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

  Drawer _drawer() {
    return Drawer(
      child: SafeArea(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.red,
            ),
            ListTile(
              title: const Text('Encode'),
              onTap: () {
                Navigator.popUntil(
                    context, ModalRoute.withName(HomeView.route));
              },
            ),
            ListTile(
              title: const Text('Decode'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _textOutput() {
    Widget text = Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: darkTheme ? Colors.grey[700] : Colors.grey[300],
          borderRadius: BorderRadius.circular(5.0)),
      //alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(output),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.copy),
          onPressed: () => FlutterClipboard.copy(output)
              .then((value) => Fluttertoast.showToast(
                  msg: 'Text Copied',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  //backgroundColor: Colors.red,
                  //textColor: Colors.white,
                  fontSize: 16.0)),
        )
      ]),
    );
    return text;
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
                    onPressed: () => setState(() => morse += '.'),
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
                    onPressed: () => setState(() => morse += '_'),
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
                    onPressed: () {
                      if (morse.isNotEmpty) {
                        setState(
                            () => morse = morse.substring(0, morse.length - 1));
                      }
                    },
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
              onPressed: () {
                if (morse.isEmpty) {
                  output += ' ';
                } else {
                  output = output + MorseCode().decode(morse) + ' ';
                  setState(() {
                    morse = '';
                  });
                }
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
              elevation: 5.0,
              color: Colors.red,
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 11.0),
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
            morse,
            style: const TextStyle(fontSize: 35),
          )
        ],
      ),
    );
  }
}
