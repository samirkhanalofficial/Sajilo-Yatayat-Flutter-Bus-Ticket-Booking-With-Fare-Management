import 'package:flutter_test/flutter_test.dart';
import 'package:tryapp/config/constants/urls.dart';
import 'package:tryapp/helper/api_helper.dart';
import 'package:tryapp/models/user_details.dart';

Future<void> main() async {
  test("Testing api helper for creating of user", () async {
    APIHelper<UserDetails> userDetails = APIHelper<UserDetails>();
    await userDetails.fetch(
      method: REQMETHOD.post,
      url: getUserDetailsUrl,
      body: {},
      parseJsonToObject: (json) => UserDetails.fromJson(json),
      testMode: true,
    );
    expect(userDetails.error.value.message, 'Invalid Token');
  });
}
