import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:story_app_bpafi/core/constants/api_constant.dart';
import 'package:story_app_bpafi/data/models/register_model.dart';
import 'package:story_app_bpafi/data/datasources/remote_datascource.dart';

class RemoteDatasourceImpl implements RemoteDatasource {
  final Client client;
  RemoteDatasourceImpl({required this.client});

  @override
  Future<RegisterModel> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      final Response = await client.post(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.registerEndpoint),
        body: {'name': name, 'email': email, 'password': password},
      );

      if (Response.statusCode == 201) {
        return RegisterModel.fromMap(jsonDecode(Response.body));
      } else {
        throw Exception(jsonDecode(Response.body)['message']);
      }
    } catch (e) {
      log('Error: $e');
      throw Exception('Failed to register user: $e');
    }
  }

}
