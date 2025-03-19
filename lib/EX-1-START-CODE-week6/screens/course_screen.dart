import 'package:flutter/material.dart';
import 'package:flutter2/EX-1-START-CODE-week6/provider/courses_provider.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import 'course_score_form.dart';



class CourseScreen extends StatelessWidget {
  final String courseName;

  const CourseScreen({super.key, required this.courseName});

  void _addScore(BuildContext context) async {
    CourseScore? newScore = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
    );

    if (newScore != null) {
      context.read<CoursesProvider>().addScore(courseName, newScore);
    }
  }

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesProvider>(
      builder: (context, provider, child) {
        final course = provider.courses.firstWhere((c) => c.name == courseName);

        Widget content = const Center(child: Text('No Scores added yet.'));
        if (course.scores.isNotEmpty) {
          content = ListView.builder(
            itemCount: course.scores.length,
            itemBuilder: (ctx, index) => ListTile(
              title: Text(course.scores[index].studentName),
              trailing: Text(
                course.scores[index].studenScore.toString(),
                style: TextStyle(
                  color: scoreColor(course.scores[index].studenScore),
                  fontSize: 15,
                ),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(course.name),
            actions: [
              IconButton(
                onPressed: () => _addScore(context),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: content,
        );
      },
    );
  }
}

