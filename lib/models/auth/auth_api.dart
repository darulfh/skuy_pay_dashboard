import 'package:flutter/cupertino.dart';
import 'package:skuy_pay_dashboard/models/auth/auth_data.dart';
import 'package:skuy_pay_dashboard/models/auth/auth_params.dart';
import 'package:skuy_pay_dashboard/models/token/token_service.dart';
import 'package:skuy_pay_dashboard/utils/const/url.dart';
import 'package:skuy_pay_dashboard/utils/network_utils/network_utils.dart';

class AuthApi {
  static const _register = "$baseUrl/admin/register";
  static const _login = "$baseUrl/login";

  Future<AuthData> register(AuthParams params) async {
    try {
      final response = await NetworkUtils.client().post(
        _register,
        data: params.toJsonRegister(),
      );

      if (response.statusCode == 201) {
        await TokenService.setToken(response.data["data"]["token"]);
      }

      debugPrint("response register: ${response.data}");

      return AuthData.fromJson(response.data["data"]);
    } catch (e) {
      debugPrint('error postInquiryBpjs: $e');
      rethrow;
    }
  }

  static Future<AuthData> login(AuthParams params) async {
    try {
      final response = await NetworkUtils.client().post(
        _login,
        data: params.toJsonLogin(),
      );

      debugPrint("response login: ${response.data}");

      if (response.statusCode == 200) {
        await TokenService.setToken(response.data["data"]["token"]);
      }

      return AuthData.fromJson(response.data["data"]);
    } catch (e, s) {
      debugPrint('error postInquiryBpjs: $e;\n$s');
      rethrow;
    }
  }
}
