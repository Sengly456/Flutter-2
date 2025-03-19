
import 'package:flutter2/EX-1-START-CODE-week6/models/course.dart';

abstract class CoursesRepository {
  List<Course> getCourses();
  void addScore(Course course,CourseScore score);
}


