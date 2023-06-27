import 'package:flutter/cupertino.dart';
import 'package:live_edu/modals/course_topics.dart';

class CourseTopicManager extends ChangeNotifier{

  List<CourseTopic> _courseTopics = [
    CourseTopic(duration: 30, id: DateTime.now().toString(), title: "In the Kitchen", subTitle: "Talking about food in kitchen", videoThumbnail: "asstes/illustrations/svgviewer-output (5).png"),
    CourseTopic(duration: 27, id: DateTime.now().toString(), title: "Bulletin board", subTitle: "Shooping conversation near bullrtin board", videoThumbnail: "asstes/illustrations/svgviewer-output (8).png"),
    CourseTopic(duration: 29, id: DateTime.now().toString(), title: "Night City", subTitle: "Night walk in the city", videoThumbnail: "asstes/illustrations/svgviewer-output (7).png"),
    CourseTopic(duration: 27, id: DateTime.now().toString(), title: "Plan for the day", subTitle: "Plan something special for the day", videoThumbnail: "asstes/illustrations/svgviewer-output (4).png"),
    CourseTopic(duration: 30, id: DateTime.now().toString(), title: "In the Kitchen", subTitle: "Talking about food in kitchen", videoThumbnail: "asstes/illustrations/svgviewer-output (5).png"),
    CourseTopic(duration: 27, id: DateTime.now().toString(), title: "Bulletin board", subTitle: "Shooping conversation near bullrtin board", videoThumbnail: "asstes/illustrations/svgviewer-output (8).png"),
     CourseTopic(duration: 29, id: DateTime.now().toString(), title: "Night City", subTitle: "Night walk in the city", videoThumbnail: "asstes/illustrations/svgviewer-output (7).png"),
     CourseTopic(duration: 30, id: DateTime.now().toString(), title: "In the Kitchen", subTitle: "Talking about food in kitchen", videoThumbnail: "asstes/illustrations/svgviewer-output (5).png"),
    CourseTopic(duration: 27, id: DateTime.now().toString(), title: "Bulletin board", subTitle: "Shooping conversation near bullrtin board", videoThumbnail: "asstes/illustrations/svgviewer-output (8).png"),
    CourseTopic(duration: 29, id: DateTime.now().toString(), title: "Night City", subTitle: "Night walk in the city", videoThumbnail: "asstes/illustrations/svgviewer-output (7).png"),
    CourseTopic(duration: 27, id: DateTime.now().toString(), title: "Plan for the day", subTitle: "Plan something special for the day", videoThumbnail: "asstes/illustrations/svgviewer-output (4).png"),
    CourseTopic(duration: 30, id: DateTime.now().toString(), title: "In the Kitchen", subTitle: "Talking about food in kitchen", videoThumbnail: "asstes/illustrations/svgviewer-output (5).png"),
    CourseTopic(duration: 27, id: DateTime.now().toString(), title: "Bulletin board", subTitle: "Shooping conversation near bullrtin board", videoThumbnail: "asstes/illustrations/svgviewer-output (8).png"),
     CourseTopic(duration: 29, id: DateTime.now().toString(), title: "Night City", subTitle: "Night walk in the city", videoThumbnail: "asstes/illustrations/svgviewer-output (7).png"),
    CourseTopic(duration: 27, id: DateTime.now().toString(), title: "Plan for the day", subTitle: "Plan something special for the day", videoThumbnail: "asstes/illustrations/svgviewer-output (4).png"),
    CourseTopic(duration: 27, id: DateTime.now().toString(), title: "Plan for the day", subTitle: "Plan something special for the day", videoThumbnail: "asstes/illustrations/svgviewer-output (4).png"),
  ] ;

  List<CourseTopic> get courseTopics => _courseTopics; 

}