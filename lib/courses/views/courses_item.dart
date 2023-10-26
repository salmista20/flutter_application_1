import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:continental_app/courses/view_models/courses_view_model.dart';

import 'package:continental_app/courses/models/course_model.dart';
import 'package:continental_app/courses/models/category_course_model.dart';

class CoursesItem extends StatelessWidget {
  const CoursesItem(this.course, this.onSelect, {super.key});

  final CourseModel course;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    CoursesViewModel coursesViewModel = context.watch<CoursesViewModel>();
    return InkWell(
      child: Card(
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(course.category.icon),
              ),
            ),
            Text(course.title),
          ],
        ),
      ),
      onTap: () async {
        await coursesViewModel.setDetailCourse(course);
        onSelect();
      },
    );
  }
}
