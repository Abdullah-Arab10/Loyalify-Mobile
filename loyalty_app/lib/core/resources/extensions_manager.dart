import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';

class Extensions {
  static String extractIdFromToken() {
    final AppPreferences appPreferences = getIt.get<AppPreferences>();
    String id = '';
    appPreferences.getToken().then((value) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(value);
      id = decodedToken['sub'];
    });
    return id;
  }

  static String extractRoleFromToken() {
    final AppPreferences appPreferences = getIt.get<AppPreferences>();
    String role = '';
    appPreferences.getToken().then((value) {
      role = JwtDecoder.decode(value)['role'];
    });
    return role;
  }
}
