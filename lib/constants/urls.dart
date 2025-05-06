import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrls {
  static final String baseurl = dotenv.env['BASE_URL']!;
  static final String login = "auth/login";
  static final String getProduct = "products ";
  static final String updateProduct = "product_id";
}
