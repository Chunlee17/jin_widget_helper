import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jin Widget Helper',
      navigatorKey: JinNavigator.navigatorKey,
      theme: ThemeData(
        primarySwatch: JinColorUtils.hexColorToMaterialColor(0xff08f7ff),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with FormPageMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jin Widget Helper Example"),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: formKey,
            child: Column(
              children: [
                PasswordTextFieldBuilder(
                  builder: (obsecure) => TextFormField(
                    obscureText: obsecure,
                    decoration: InputDecoration(
                      suffixIcon: SmallIconButton(
                        icon: Icon(
                          obsecure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onTap: togglePasswordObsecure,
                      ),
                    ),
                  ),
                ),
                ActionButton(
                  child: Text("Click Me"),
                  loadingNotifier: loadingNotifier,
                  onPressed: () {
                    () async {
                      await Future.delayed(Duration(seconds: 3));
                      throw "Shit we got an error";
                    }.indicateLoading(
                        loadingNotifier: loadingNotifier,
                        onError: (error) {
                          JinNavigator.dialog(JinSimpleDialog(content: error));
                        });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
