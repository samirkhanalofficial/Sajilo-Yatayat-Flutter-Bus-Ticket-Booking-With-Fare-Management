import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<Options> getHeader() async {
  String token = await FirebaseAuth.instance.currentUser?.getIdToken() ?? "";
  return Options(
    headers: {
      "Authorization": token,
      "Content-Type": "application/json",
    },
  );
}
