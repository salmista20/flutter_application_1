import 'package:flutter/material.dart';

class CoursesHeader extends StatelessWidget {
  const CoursesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 8, bottom: 8, right: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 196, 59, 59),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.book_outlined,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Lista de cursos',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
