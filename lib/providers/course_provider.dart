import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_edu/controllers/course_topics_controller.dart';

import '../controllers/course_controller.dart';

final courseProvider = ChangeNotifierProvider((ref) => CourseManager());

final courseTopicProvider = ChangeNotifierProvider((ref) =>CourseTopicManager());