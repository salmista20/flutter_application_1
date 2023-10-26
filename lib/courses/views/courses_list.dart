import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:continental_app/courses/models/course_model.dart';

import 'package:continental_app/courses/view_models/courses_view_model.dart';
import 'package:continental_app/courses/views/courses_item.dart';

class CoursesList extends StatelessWidget {
  const CoursesList(this.courses, this.onSelect, {super.key});

  final List<CourseModel> courses;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    CoursesViewModel coursesViewModel = context.watch<CoursesViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        itemCount: coursesViewModel.courseListModel.length,
        itemBuilder: (ctx, index) => Dismissible(
          background: Container(
            color: Colors.redAccent,
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
          onDismissed: (direction) {
            coursesViewModel.removeCourse(courses[index]);
          },
          key: ValueKey(courses[index]),
          child: CoursesItem(courses[index], onSelect),
        ),
      ),
    );
  }
}
