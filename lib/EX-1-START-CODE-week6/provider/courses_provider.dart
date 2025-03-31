import 'package:flutter/material.dart';
import 'package:flutter2/EX-1-START-CODE-week6/models/course.dart';
import 'package:flutter2/EX-1-START-CODE-week6/repository/courses_repository.dart';


class CoursesProvider extends ChangeNotifier{
  final CoursesRepository repository;
  CoursesProvider({required this.repository}){
    fectCourses();
  }

  List<Course> _courses = [];

  //getter for the private courses
  List<Course> get courses => _courses;

  //fetch courses from repo
  void fectCourses(){
    _courses=repository.getCourses();
    notifyListeners();
  }

  Course getCourseFor(String courseName){
    return _courses.firstWhere(
      (course)=>course.name == courseName,
      );
  }

  void addScore(String courseId,CourseScore score){
    getCourseFor(courseId).addScore(score);
    notifyListeners();
  }
  
  
}