import 'package:buzz_me/resources/firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    "Room name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}"),
                subtitle: Text(
                    "Joined on ${DateFormat.yMMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}"),
              );
            });
      },
    );
  }
}
