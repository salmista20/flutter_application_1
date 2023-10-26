import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:continental_app/product/models/category_course_model.dart';

import 'package:continental_app/product/view_models/courses_view_model.dart';
import 'package:continental_app/common_components/error_dialog.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() {
    return _ProductDetailState();
  }
}

class _ProductDetailState extends State<ProductDetail> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitData(
    CoursesViewModel coursesViewModel,
    BuildContext context,
  ) async {
    bool isSaved = await coursesViewModel.saveCourse();
    if (!context.mounted) {
      return;
    }
    if (!isSaved) {
      showErrorDialog(context);
      return;
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    CoursesViewModel coursesViewModel = context.watch<CoursesViewModel>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController
              ..text = coursesViewModel.detailCourse?.title ?? '',
            maxLength: 100,
            decoration: const InputDecoration(
              label: Text('Nombre del curso:'),
            ),
            onChanged: (text) => coursesViewModel.detailCourse?.title = text,
          ),
          Row(
            children: [
              const Text('Tipo de categoria:'),
              const SizedBox(width: 10),
              DropdownButton(
                items: CategoryCourseModel.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        ))
                    .toList(),
                value: coursesViewModel.detailCourse?.category ??
                    CategoryCourseModel.web,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    coursesViewModel.detailCourse?.category = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 196, 59, 59)),
            onPressed: () async {
              _submitData(coursesViewModel, context);
            },
            child: Text(
                coursesViewModel.isNewCourse ? 'Save Course' : 'Update Course'),
          )
        ],
      ),
    );
  }
}
