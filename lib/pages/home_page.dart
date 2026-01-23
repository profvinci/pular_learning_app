//Navigation and Page Switching

import 'package:flutter/material.dart';
import '../data/lesson_registry.dart';
import 'lessons_page.dart';
import 'quiz_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() => currentPageIndex = index);
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.class_), label: 'Lessons'),
          NavigationDestination(icon: Icon(Icons.quiz), label:'Quizzes'),
        ],
      ),
      body:[
        /// Home Page
        _buildHome(theme),

        /// Lessons Page
        LessonsPage(
          lessons: allLessons,
          onLessonsUpdated: () {
            setState(() {});
          },
        ),
        
        /// Quizzes Page
        QuizPage(
          lessons: allLessons,
          onQuizUpdated: () {
            setState(() {});
          },),
      ][currentPageIndex],
    );
  }

  Widget _buildHome(ThemeData theme) {
    final now = DateTime.now();
    final months = ['January','February', 'March','April','May','June','July','August',
                  'September','October','November','December',
    ];

    return Padding(
      padding: const EdgeInsetsGeometry.fromLTRB(8,100,8,8),
      child: Column(
        children: [
          Center(
            child: Text('${months[now.month - 1]} ${now.day}, ${now.year}',
                  style: theme.textTheme.headlineSmall,
                  ),
          ),
          const SizedBox(height:20),
          const Card(
            child: ListTile(
              leading: Icon(Icons.book),
              title: Text('Continue Learning'),
              subtitle: Text('Pick up where you left off in Pulaar'),
            ),
          ),
        ],
      ),
    );
  }
}