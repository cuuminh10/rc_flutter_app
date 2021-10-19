import 'dart:convert';

import 'package:get/get.dart';
import 'package:gmc_app/models/models.dart';
import 'package:gmc_app/models/request/login_request.dart';
import 'package:gmc_app/models/response/demand_response.dart';
import 'package:gmc_app/models/response/draw_response.dart';
import 'package:gmc_app/models/response/plans_response.dart';
import 'package:gmc_app/models/response/project_list_response.dart';

import 'api_provider.dart';

class ApiRepository {
  ApiRepository({this.apiProvider});

  final ApiProvider apiProvider;
}
