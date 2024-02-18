import 'package:firebase_auth/firebase_auth.dart';

Future<Map<String, String>> getHeader() async {
  String token = await FirebaseAuth.instance.currentUser?.getIdToken() ?? "";
  return {
    "Authorization": token,
    "method": "POST",
    "Content-Type": "application/json"
  };
}
