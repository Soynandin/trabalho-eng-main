import 'package:engenharia_projeto/app/login/login.binding.dart';
import 'package:flutter/material.dart';
import 'package:engenharia_projeto/app/login/login.view.dart';
import 'package:engenharia_projeto/app/login/recover_password.view.dart';
import 'package:engenharia_projeto/app/controller/recover_password.controller.dart'; // Importe seu controlador
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBEz_2pRGk0JtqP9yOshcLSBv0YfTIlDFs",
      authDomain: "backend-forms-afde8.firebaseapp.com",
      projectId: "backend-forms-afde8",
      storageBucket: "backend-forms-afde8.appspot.com",
      messagingSenderId: "479619835811",
      appId: "1:479619835811:web:d8eaf0147a2a5d14361c16",
    ),
  );
  
  // Registre o RecoverPasswordController
  Get.put(RecoverPasswordController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: LoginBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(),
      getPages: [
        GetPage(name: '/', page: () => const LoginView()),
        GetPage(name: '/login', page: () => const LoginView()), // Rota de login
        GetPage(name: '/recover-password', page: () => const RecoverPasswordView()), // Rota de recuperação de senha
      ],
    );
  }
}
