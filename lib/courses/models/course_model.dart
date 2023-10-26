import 'package:continental_app/utils/constants.dart';

import 'package:continental_app/courses/models/category_course_model.dart';

class CourseModel {
  String identifier;
  String title;
  CategoryCourseModel category;

  CourseModel({
    required this.identifier,
    required this.title,
    required this.category,
  });

  CourseModel.newCourse({
    required this.title,
    required this.category,
  }) : identifier = uuid.v4();

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    String stringCategory = json['category'] as String;
    return CourseModel(
      identifier: json['id'] as String,
      title: json['name'] as String,
      category: CategoryCourseModel.byName(stringCategory),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': title,
        'category': category.name,
      };
}
