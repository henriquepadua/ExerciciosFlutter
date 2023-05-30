import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),),
        drawer: const Drawer(),
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Minha conta',
              )
            ]
        ),
        body: Padding(
            padding:  const EdgeInsets.fromLTRB(50, 0, 50, 25),
            child:Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    style:TextStyle(color:Colors.black,fontSize:30),
                    decoration: InputDecoration(
                        labelText: "E-mail",
                        contentPadding: EdgeInsets.all(10.0),
                        labelStyle:TextStyle(color: Colors.black)
                    ),
                  ),
                  Divider(),
                  TextField(
                      autofocus: true,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black, fontSize: 30),
                      decoration: InputDecoration(
                        labelText:"Password",
                        contentPadding: EdgeInsets.all(10.0),
                        labelStyle: TextStyle(color: Colors.black),
                      )
                  ),
                  Divider(),
                  Container(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 25),
                      child: ElevatedButton(
                          child: const Text('Login', textAlign: TextAlign.center),
                          onPressed: () => {}
                      )
                  ),
                  const Text(
                    'Primeiro acesso?',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                    textAlign: TextAlign.center
                  ),
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    TextButton(
                    child: const Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () => {}
                    )
                    ]),
                ],
              ),
            )
        ),
      ),
    );
  }
}