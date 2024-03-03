import 'package:firebase_auth/firebase_auth.dart';

Future<Map<String, String>> getHeader({bool testMode = false}) async {
  if (testMode) {
    return {
      "Authorization": "xyz",
      "method": "POST",
      "Content-Type": "application/json"
    };
  } else {
    String token = await FirebaseAuth.instance.currentUser?.getIdToken() ?? "";
    print(token);
    return {
      "Authorization": token,
      "method": "POST",
      "Content-Type": "application/json"
    };
  }
}
