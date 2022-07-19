import 'dart:math';

import 'package:buzz_me/resources/jitsi_meetting_methods.dart';
import 'package:flutter/material.dart';

import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMethods _jitsiMethods = JitsiMethods();
  createNewMeeting() async {
    var random = Random();

    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMethods.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video_call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              text: 'New Meeting',
            ),
            HomeMeetingButton(
              onPressed: () {
                joinMeeting(context);
              },
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.calendar_today,
              text: 'Schedule',
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.arrow_upward,
              text: 'Share Screen',
            ),
          ],
        ),
        const Expanded(
            child: Center(
          child: Text(
            'Create/Join Meetings with just a click!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ))
      ],
    );
  }
}
