import 'package:flutter/material.dart';
import 'package:tranfluuer/privacypolicy.dart';
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

  // If you want to add your country in the list, just add the code in the list.
  // Country Code List: https://cloud.google.com/translate/docs/languages
  //
  List<String> availableLang = <String>[
    'Afrikaans',
    'Albanian',
    'Amharic',
    'Arabic',
    'Armenian',
    'Assamese',
    'Aymara',
    'Azerbaijani',
    'Bambara',
    'Basque',
    'Belarusian',
    'Bengali',
    'Bhojpuri',
    'Bosnian',
    'Bulgarian',
    'Catalan',
    'Cebuano',
    'Chinese (Simplified)',
    'Chinese (Traditional)',
    'Corsican',
    'Croatian',
    'Czech',
    'Danish',
    'Dhivehi',
    'Dogri',
    'Dutch',
    'English',
    'Esperanto',
    'Estonian',
    'Ewe',
    'Filipino (Tagalog)',
    'Finnish',
    'French',
    'Frisian',
    'Galician',
    'Georgian',
    'German',
    'Greek',
    'Guarani',
    'Gujarati',
    'Haitian Creole',
    'Hausa',
    'Hawaiian',
    'Hebrew',
    'Hindi',
    'Hmong',
    'Hungarian',
    'Icelandic',
    'Igbo',
    'Ilocano',
    'Indonesian',
    'Irish',
    'Italian',
    'Japanese',
    'Javanese',
    'Kannada',
    'Kazakh',
    'Khmer',
    'Kinyarwanda',
    'Konkani',
    'Korean',
    'Krio',
    'Kurdish',
    'Kurdish (Sorani)',
    'Kyrgyz',
    'Lao',
    'Latin',
    'Latvian',
    'Lingala',
    'Lithuanian',
    'Luganda',
    'Luxembourgish',
    'Macedonian',
    'Maithili',
    'Malagasy',
    'Malay',
    'Malayalam',
    'Maltese',
    'Maori',
    'Marathi',
    'Meiteilon (Manipuri)',
    'Mizo',
    'Mongolian',
    'Myanmar (Burmese)',
    'Nepali',
    'Norwegian',
    'Nyanja (Chichewa)',
    'Odia (Oriya)',
    'Oromo',
    'Pashto',
    'Persian',
    'Polish',
    'Portuguese (Portugal, Brazil)',
    'Punjabi',
    'Quechua',
    'Romanian',
    'Russian',
    'Samoan',
    'Sanskrit',
    'Scots Gaelic',
    'Sepedi',
    'Serbian',
    'Sesotho',
    'Shona',
    'Sindhi',
    'Sinhala (Sinhalese)',
    'Slovak',
    'Slovenian',
    'Somali',
    'Spanish',
    'Sundanese',
    'Swahili',
    'Swedish',
    'Tagalog (Filipino)',
    'Tajik',
    'Tamil',
    'Tatar',
    'Telugu',
    'Thai',
    'Tigrinya',
    'Tsonga',
    'Turkish',
    'Turkmen',
    'Twi (Akan)',
    'Ukrainian',
    'Urdu',
    'Uyghur',
    'Uzbek',
    'Vietnamese',
    'Welsh',
    'Xhosa',
    'Yiddish',
    'Yoruba',
    'Zulu'
  ];
  List<String> languageCode = <String>[
    // 'en',
    // 'ne',
    // 'ja',
    // 'ko',
    // 'af',
    // 'sq',
    // 'am',
    // 'ar',
    // 'hy',
    // 'as'
    'sq',
    'am',
    'ar',
    'hy',
    'as',
    'ay',
    'az',
    'bm',
    'eu',
    'be',
    'bn',
    'bho',
    'bs',
    'bg',
    'ca',
    'ceb',
    'zh-CN',
    'zh-TW',
    'co',
    'hr',
    'cs',
    'da',
    'dv',
    'doi',
    'nl',
    'en',
    'eo',
    'et',
    'ee',
    'fil',
    'fi',
    'fr',
    'fy',
    'gl',
    'ka',
    'de',
    'el',
    'gn',
    'gu',
    'ht',
    'ha',
    'haw',
    'he',
    'hi',
    'hmn',
    'hu',
    'is',
    'ig',
    'ilo',
    'id',
    'ga',
    'it',
    'ja',
    'jv',
    'kn',
    'kk',
    'km',
    'rw',
    'gom',
    'ko',
    'kri',
    'ku',
    'ckb',
    'ky',
    'lo',
    'la',
    'lv',
    'ln',
    'lt',
    'lg',
    'lb',
    'mk',
    'mai',
    'mg',
    'ms',
    'ml',
    'mt',
    'mi',
    'mr',
    'mni-Mtei',
    'lus',
    'mn',
    'my',
    'ne',
    'no',
    'ny',
    'or',
    'om',
    'ps',
    'fa',
    'pl',
    'pt',
    'pa',
    'qu',
    'ro',
    'ru',
    'sm',
    'sa',
    'gd',
    'nso',
    'sr',
    'st',
    'sn',
    'sd',
    'si',
    'sk',
    'sl',
    'so',
    'es',
    'su',
    'sw',
    'sv',
    'tl',
    'tg',
    'ta',
    'tt',
    'te',
    'th',
    'ti',
    'ts',
    'tr',
    'tk',
    'ak',
    'uk',
    'ur',
    'ug',
    'uz',
    'vi',
    'cy',
    'xh',
    'yi',
    'yo',
    'zu',
  ];
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
              height: 60,
            ),
            const Center(
                child: Text('TamilanProject',
                    style: TextStyle(
                        color: Color.fromARGB(255, 33, 192, 2), fontSize: 20))),

            const SizedBox(
              height: 40,
              // child: InkWell(
              //       onTap:() => NewMemory(),
              // ),
            ),
            const Center(
                child: Text('Try Full version',
                    style: TextStyle(
                        color: Color.fromARGB(255, 33, 192, 2), fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
