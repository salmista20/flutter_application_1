import 'package:flutter/material.dart';

enum CategoryProductModel {
  Comida,
  Bebida;

  factory CategoryCourseModel.byName(String name) {
    for (var value in CategoryCourseModel.values) {
      if (value.name == name) return value;
    }
    throw ArgumentError.value(name, "name", "No enum value with that name");
  }
}

extension CategoryCourseModelExtension on CategoryCourseModel {
  IconData get icon {
    switch (this) {
      case CategoryCourseModel.mobile:
        return Icons.mobile_friendly;
      case CategoryCourseModel.web:
        return Icons.web;
      case CategoryCourseModel.cloud:
        return Icons.filter_drama_outlined;
    }
  }
}
