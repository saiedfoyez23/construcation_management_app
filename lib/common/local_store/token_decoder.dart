import 'dart:developer';

import 'package:jwt_decoder/jwt_decoder.dart';

String? getConstructionToken(String token) {
  try {
    final decodedToken = JwtDecoder.decode(token);
    return decodedToken['id'];
  } catch (e) {
    log('Error decoding token: $e');
    return null;
  }
}
