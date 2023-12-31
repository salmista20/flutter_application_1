import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:continental_app/courses/courses_builder.dart';
import 'package:continental_app/courses/views/courses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoursesBuilder.builder()),
      ],
      child: const MaterialApp(
        home: Courses(),
      ),
    );
  }
}
