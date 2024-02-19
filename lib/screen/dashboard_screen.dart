import 'package:atividade_rotas/screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DashboardScreen());
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checklist de atividades"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage('assets/nico.jpg'),
              ),
                accountName: Text("Nico Rei Delas"),
                accountEmail: Text("Nicoreidelas@gmail.com")
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              onTap: () => onButtonSairClicked(context),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const[
            ListTile(
              leading: Icon(Icons.check),
              title: Text("Estudar Flutter"),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text("Estudar Unity"),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text("Estudar Dart"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed("/register");
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onButtonSairClicked(BuildContext context){
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //     builder: (context) => LoginScreen(),
    // ),
    // );
    Navigator.of(context).pushReplacementNamed("/login");
  }
}

