import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class StudentsTab extends StatelessWidget {
  const StudentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    List students = [
      {
        'name': 'Benny Spankbauer',
        'role': 'Student',
        'avatar': 'https://via.placeholder.com/50',
      },
      {
        'name': 'Freida Vannes',
        'role': 'Junior Designer',
        'avatar': 'https://via.placeholder.com/50',
      },
      {
        'name': 'Francesca Vandyne',
        'role': 'Student',
        'avatar': 'https://via.placeholder.com/50',
      },
      {
        'name': 'Tanner Stafford',
        'role': 'Freelancer',
        'avatar': 'https://via.placeholder.com/50',
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: students.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> student = students[index];
        return Card(
          margin: EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(student['avatar']),
              radius: 20,
            ),
            title: Text(student['name']),
            subtitle: Text(student['role']),
            trailing: Icon(IconlyLight.chat, color: Colors.blue),
          ),
        );
      },
    );  }
}

