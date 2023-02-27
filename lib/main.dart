import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Translator App",
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownFrom = "English";
  String dropdownTo = "Nepali";
  String userinput = "";
  String result = "";
  // This is made by Bishworaj Poudel for FlutterHope.com
  // https://www.flutterhope.com/
  // If you want to add your country in the list, just add the code in the list.
  // Country Code List: https://cloud.google.com/translate/docs/languages
  //
  List<String> availableLang = <String>[
    'English',
    'Nepali',
    'Japnease',
    'Korean',
    'Afrikaans',
    'Albanian'
  ];
  List<String> languageCode = <String>['en', 'ne', 'ja', 'ko', 'af', 'sq'];
//Translate
  resultTranslate() async {
    final translator = GoogleTranslator();
    translator
        .translate(userinput,
            from: languageCode[availableLang.indexOf(dropdownFrom)],
            to: languageCode[availableLang.indexOf(dropdownTo)])
        .then(print);
    var translation = await translator.translate(userinput,
        to: languageCode[availableLang.indexOf(dropdownTo)]);
    setState(() {
      result = translation.text;
    });
    // prints exemplo
  }

// Translate
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Translator App"),
        backgroundColor: Color.fromARGB(255, 184, 3, 3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            // First Row
            Row(
              children: [
                const Expanded(flex: 1, child: Text('From:  ')),
                Expanded(
                  flex: 5,
                  child: DropdownButton<String>(
                    value: dropdownFrom,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownFrom = newValue!;
                      });
                    },
                    items: availableLang
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            // Second Row
            Row(
              children: [
                const Expanded(flex: 1, child: Text('To:  ')),
                Expanded(
                  flex: 5,
                  child: DropdownButton<String>(
                    value: dropdownTo,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownTo = newValue!;
                      });
                    },
                    items: availableLang
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            // TextFeild
            TextField(
              maxLines: 5,
              onChanged: (val) {
                setState(() {
                  userinput = val;
                });
              },
              decoration: const InputDecoration(
                  hintText: "Enter something",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
                height: 50,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: Colors.blue,
                    )),
                child: const Text('Translate',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onPressed: () {
                  resultTranslate();
                }),

            // Result
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Text('Result: $result',
                    style: const TextStyle(color: Colors.black, fontSize: 20))),

            const SizedBox(
              height: 100,
            ),
            const Center(
                child: Text('TamilanProject',
                    style: TextStyle(
                        color: Color.fromARGB(255, 33, 192, 2), fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
