import 'package:flutter/material.dart';
import 'package:skuy_pay_dashboard/models/token/token_service.dart';
import 'package:skuy_pay_dashboard/models/user/user_data.dart';
import 'package:skuy_pay_dashboard/models/user/user_params.dart';
import 'package:skuy_pay_dashboard/utils/const/url.dart';
import 'package:skuy_pay_dashboard/utils/network_utils/network_utils.dart';

class UserApi {
  static const _user = "$baseUrl/admin/users";

  static Future<List<UserData>> getUsers(UserParams params) async {
    try {
      final token = await TokenService.getToken();
      final response = await NetworkUtils.client(token: token).get(
        _user,
        queryParameters: params.toQueryParams(),
      );

      debugPrint("response getUsers: ${response.data}");

      return (response.data["data"] as List)
          .map((e) => UserData.fromJson(e))
          .toList();
    } catch (e) {
      debugPrint('error getUsers: $e');
      rethrow;
    }
  }
}
