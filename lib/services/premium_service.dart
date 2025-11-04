import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PremiumService {
  static Future<bool> isPremium() async {
    try {
      CustomerInfo info = await Purchases.getCustomerInfo();
      return info.entitlements.active.containsKey("premium");
    } catch (e) {
      return false;
    }
  }

  static Future<int> getContextualCount(String userId) async {
    final snap = await FirebaseFirestore.instance
        .collection('thoughts')
        .where('userId', isEqualTo: userId)
        .where('isContextual', isEqualTo: true)
        .get();
    return snap.docs.length;
  }
}