import 'package:cloud_functions/cloud_functions.dart';
import 'premium_service.dart';

class ApiService {
  static final _functions = FirebaseFunctions.instance;

  static Future<void> analyzeAndStore(String text) async {
    final isPremium = await PremiumService.isPremium();
    final callable = _functions.httpsCallable('analyzeThought');

    try {
      await callable.call({
        'rawText': text,
        'isPremium': isPremium,
      });
    } catch (e) {
      if (e.toString().contains('Límite')) {
        throw Exception('Límite de 5 alcanzado. ¡Suscríbete!');
      }
      rethrow;
    }
  }
}