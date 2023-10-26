import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:continental_app/courses/view_models/courses_view_model.dart';

import 'package:continental_app/common_components/app_loading.dart';
import 'package:continental_app/courses/views/courses_header.dart';
import 'package:continental_app/courses/views/courses_list.dart';
import 'package:continental_app/courses/views/course_detail.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() {
    return _CoursesState();
  }
}

class _CoursesState extends State<Courses> {
  void _openDetailCourse() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => const CourseDetail());
  }

  List<Widget>? _barActions(CoursesViewModel coursesViewModel) {
    return [
      IconButton(
        onPressed: () {
          coursesViewModel.setNewCourse();
          _openDetailCourse();
        },
        icon: const Icon(Icons.add),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    CoursesViewModel coursesViewModel = context.watch<CoursesViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instituto Continental'),
        backgroundColor: const Color.fromARGB(255, 196, 59, 59),
        actions: _barActions(coursesViewModel),
      ),
      body: _ui(coursesViewModel),
    );
  }

  _ui(CoursesViewModel coursesViewModel) {
    if (coursesViewModel.loading) {
      return const AppLoading();
    }

    if (coursesViewModel.courseError != null) {
      return Container();
    }

    return Column(
      children: [
        const CoursesHeader(),
        Expanded(
          child: CoursesList(
            coursesViewModel.courseListModel,
            _openDetailCourse,
          ),
        )
      ],
    );
  }
}
