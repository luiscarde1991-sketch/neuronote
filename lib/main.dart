import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/notification_service.dart';
import 'features/capture/capture_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // CONFIGURACIÓN PARA WEB (usa firebase.json automáticamente)
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB1X-kaT4TSLp6EJmhC2qZ7W8KLdl6jEXs",
      authDomain: "neuronote-app-c59e7.firebaseapp.com",
      projectId: "neuronote-app-c59e7",
      storageBucket: "neuronote-app-c59e7.firebasestorage.app",
      messagingSenderId: "703592250162",
      appId: "1:703592250162:web:23f1aaea77fb437f9bb52b",
    ),
  ); // ← CIERRE CORRECTO

  await NotificationService.initialize(); // ← AHORA SÍ

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neuronote',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const CaptureScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}