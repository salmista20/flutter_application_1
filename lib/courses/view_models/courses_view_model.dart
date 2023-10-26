import 'package:flutter/material.dart';

import 'package:continental_app/courses/services/icourse_service.dart';

import 'package:continental_app/courses/models/course_model.dart';
import 'package:continental_app/courses/models/category_course_model.dart';
import 'package:continental_app/courses/models/error_service_model.dart';

class CoursesViewModel extends ChangeNotifier {
  bool _loading = false;
  List<CourseModel> _courseListModel = [];
  ErrorServiceModel? _courseError;
  CourseModel? _detailCourse;
  bool _isNewCourse = true;
  final ICourseService _courserService;

  bool get loading => _loading;
  List<CourseModel> get courseListModel => _courseListModel;
  ErrorServiceModel? get courseError => _courseError;
  CourseModel? get detailCourse => _detailCourse;
  bool get isNewCourse => _isNewCourse;

  CoursesViewModel(this._courserService) {
    getCourses();
  }

  _setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  _setCourseListModel(List<CourseModel> courseListModel) {
    _courseListModel = courseListModel;
  }

  _setCourseError(ErrorServiceModel courseError) {
    _courseError = courseError;
  }

  bool _validCourse() {
    if (detailCourse == null) {
      return false;
    }

    if (detailCourse!.title.trim().isEmpty) {
      return false;
    }
    return true;
  }

  getCourses() async {
    _setLoading(true);
    var response = await _courserService.getCourses(null);
    if (response is List<CourseModel>) {
      _setCourseListModel(response);
    } else if (response is ErrorServiceModel) {
      _setCourseError(response as ErrorServiceModel);
    }
    _setLoading(false);
  }

  setNewCourse() async {
    _isNewCourse = true;
    _detailCourse = CourseModel.newCourse(
      title: '',
      category: CategoryCourseModel.web,
    );
    notifyListeners();
  }

  setDetailCourse(CourseModel detailCourse) async {
    _isNewCourse = false;
    _detailCourse = detailCourse;
    notifyListeners();
  }

  saveCourse() async {
    if (_validCourse()) {
      final json = _detailCourse!.toJson();
      if (_isNewCourse) {
        await _courserService.addCourse(json);
      } else {
        await _courserService.updateCourse(
          _detailCourse!.identifier,
          json,
        );
      }
      await getCourses();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  removeCourse(CourseModel? course) async {
    await Future.delayed(const Duration(seconds: 1));
    _courseListModel.remove(course);
    notifyListeners();
  }
}
