import 'package:flutter/material.dart';
import 'encrypt_algorithm.dart';
import 'popup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlayFairEncryption',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'PlayFair Encryption'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  PlayFairEncrypt encryption = PlayFairEncrypt();

  String message = "";
  bool loading = false;

  // Declaring the Controllers
  TextEditingController keyController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title!,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              )),
          actions: [
            IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  ShowInfo(context);
                }),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/caesar-cipher.png", height: 70, width: 70),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    loading
                        ? CircularProgressIndicator()
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Key         : ${keyController.text} ",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Message   : ${messageController.text} ",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Encrypted : $message ",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: TextField(
                  controller: keyController,
                  cursorColor: Theme.of(context).cursorColor,
                  maxLength: 2000,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.security_rounded,
                    ),
                    labelText: ' Key ',
                    labelStyle: TextStyle(
                      color: Color(0xFF006699),
                    ),
                    helperText: 'Enter the encryption key ',
                    suffixIcon: Icon(
                      Icons.check_circle,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF006699)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: TextField(
                  controller: messageController,
                  // decoration: InputDecoration(labelText: " "),
                  cursorColor: Theme.of(context).cursorColor,
                  maxLength: 2000,
                  maxLines: 3,
                  decoration: InputDecoration(
                    icon: Icon(Icons.message),
                    labelText: ' Message ',
                    labelStyle: TextStyle(
                      color: Color(0xFF006699),
                    ),
                    helperText: 'Enter the message in the entry box above',
                    suffixIcon: Icon(
                      Icons.check_circle,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
                  onPressed: () {
                    encryption = PlayFairEncrypt();
                    encryption.makeArray(keyController.text);
                    String messag =
                        encryption.manageMessage(messageController.text);
                    encryption.doPlayFair(messag);
                    Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                        this.loading = false;
                      });
                    });
                    String newmessage = encryption.encryptedMessage;
                    setState(() {
                      this.message = newmessage;
                      this.loading = true;
                    });
                  },
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "Encrypt",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          keyController.text = "";
          messageController.text = "";
        },
        tooltip: 'Increment',
        child: Icon(Icons.clear),
      ),
    );
  }
}
