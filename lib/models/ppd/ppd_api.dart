import 'package:flutter/material.dart';
import 'package:skuy_pay_dashboard/models/ppd/ppd_data.dart';
import 'package:skuy_pay_dashboard/models/ppd/ppd_params.dart';
import 'package:skuy_pay_dashboard/models/token/token_service.dart';
import 'package:skuy_pay_dashboard/utils/const/url.dart';
import 'package:skuy_pay_dashboard/utils/network_utils/network_utils.dart';

class PpdApi {
  static const _ppd = "$baseUrl/admin/ppd";

  static Future<PpdData> createPpd(PpdData params) async {
    try {
      final token = await TokenService.getToken();
      final response = await NetworkUtils.client(token: token).post(
        _ppd,
        data: params.toParams(),
      );

      debugPrint("response createPpd: ${response.data}");

      return PpdData.fromJson(response.data["data"]);
    } catch (e) {
      debugPrint('error createPpd: $e');
      rethrow;
    }
  }

  static Future<PpdData> updatePpd(PpdData params) async {
    try {
      final token = await TokenService.getToken();
      final response = await NetworkUtils.client(token: token).put(
        "$_ppd/${params.id}",
        data: params.toParams(),
      );

      debugPrint("response updatePpd: ${response.data}");

      return PpdData.fromJson(response.data["data"]);
    } catch (e) {
      debugPrint('error updatePpd: $e');
      rethrow;
    }
  }

  static Future<bool> deletePpd(String id) async {
    try {
      final token = await TokenService.getToken();
      final response = await NetworkUtils.client(token: token).delete(
        "$_ppd/$id",
      );

      debugPrint("response deletePpd: ${response.data}");
      return true;
    } catch (e) {
      debugPrint('error deletePpd: $e');
      rethrow;
    }
  }

  static Future<List<PpdData>> getPpd(PpdParams params) async {
    try {
      final token = await TokenService.getToken();

      // final a = await Dio(
      //   BaseOptions(
      //     headers: {
      //       'Accept': 'application/json',
      //       "Authorization": token,
      //     },
      //   ),
      // ).get(
      //   _ppd,
      // );

      // print("a : $a");

      // return [];

      final response = await NetworkUtils.client(token: token).get(_ppd,
          queryParameters: params.copyWith(limit: 100).toQueryParams());

      debugPrint("response getPpd: ${response.data}");

      return (response.data["data"] as List)
          .map((e) => PpdData.fromJson(e))
          .toList();
    } catch (e) {
      debugPrint('error getPpd: $e');
      rethrow;
    }
  }
}
