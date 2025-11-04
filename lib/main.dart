import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/notification_service.dart';
import 'features/capture/capture_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // CONFIGURACIÓN PARA WEB (usa firebase.json automáticamente)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await NotificationService.initialize();
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