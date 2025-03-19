import 'package:flutter2/EX-1-START-CODE-week6/models/course.dart';
import 'package:flutter2/EX-1-START-CODE-week6/repository/courses_repository.dart';


class CoursesMockRepository extends CoursesRepository {
  final List<Course> _courses = [
    Course(name: 'php'),
    Course(name: 'Javascript'),
    Course(name: 'Java'),
    Course(name: 'C++'),
  ];

  @override
  void addScore(Course course, CourseScore score) {
    course.addScore(score);
  }

  @override
  List<Course> getCourses() {
    return _courses;
  }
}
