import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];
    return MaterialApp(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('id', 'ID'),
        Locale('it', 'IT'),
        Locale('en', 'JP'),
        Locale('ko', 'KR'),
        Locale('th', 'TH'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        LocalJsonLocalization.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }
        return const Locale('en', 'US');
      },
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const Myhome(),
    );
  }
}

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  State<Myhome> createState() => MyhomeState();
}

class MyhomeState extends State<Myhome> {
  bool _ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Semantic")),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Aplikasi Semantics buatan Anak Negeri",
                  style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'.i18n())),
            ),
            Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.help),
                        title: Text(
                          "Text_call".i18n(),
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.email,
                        ),
                        title: const Text(
                          "johndoe@test.com",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {},
                      ),
                    ])),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    value: _ischecked,
                    onChanged: (value) {
                      setState(() {
                        _ischecked = value!;
                      });
                    },
                  ),
                  Text('Checkbox-agree'.i18n()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Button-sign-in".i18n())),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Button-sign-out".i18n())),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
