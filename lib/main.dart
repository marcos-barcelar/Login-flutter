import 'package:atividade_rotas/screen/dashboard_screen.dart';
import 'package:atividade_rotas/screen/register_screen.dart';
import 'package:flutter/material.dart';

import 'screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - Rotas Nomeadas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      initialRoute: "/login",
      routes: {
        "/login":(context) => LoginScreen(),
        "dashboard" : (context){
          return DashboardScreen();
        },
        "/register":(context) => RegisterScreen(),
      },
    );
  }
}

