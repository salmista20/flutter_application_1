import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:continental_app/utils/constants.dart';

import 'package:continental_app/courses/services/url_mixin.dart';
import 'package:continental_app/courses/services/icourse_service.dart';

import 'package:continental_app/courses/models/error_service_model.dart';
import 'package:continental_app/courses/models/course_model.dart';

class APICourseService with UriMixin implements ICourseService {
  final http.Client client;
  final headers = {
    'Content-Type': 'application/json',
  };

  APICourseService(this.client);

  @override
  Future<bool> addCourse(Map<String, dynamic> body) async {
    try {
      final url = getUri('course');
      var response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );
      return response.statusCode == 200;
    } catch (exception) {
      throw ErrorServiceModel(kGenericError);
    }
  }

  @override
  Future<List<Object>> getCourses(Map<String, dynamic>? queries) async {
    try {
      // final url = getUri(
      //   'course',
      //   null,
      //   queries,
      // );
      final url = getUri('course');
      var response = await http.get(url);
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((item) => CourseModel.fromJson(item)).toList();
    } on ArgumentError {
      throw ErrorServiceModel(kParseError);
    } catch (exception) {
      throw ErrorServiceModel(kGenericError);
    }
  }

  @override
  Future<bool> updateCourse(String id, Map<String, dynamic> body) async {
    try {
      final url = getUri('course/$id');
      var response = await http.patch(
        url,
        headers: headers,
        body: json.encode(body),
      );
      return response.statusCode == 200;
    } catch (exception) {
      throw ErrorServiceModel(kGenericError);
    }
  }
}
