// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart' ;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/course_provider.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  @override
  Widget build(BuildContext context) {
   final topicsManager = ref.watch(courseTopicProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Padding(
        padding:  EdgeInsets.only(bottom: 8, top:20, left:16, right:10),
        child: Text("Quiz Topics",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
      ),
      Expanded(child: ListView.builder(
        itemCount: topicsManager.courseTopics.length,
        itemBuilder: (ctx , index){
        return Padding(
          padding: const EdgeInsets.only(bottom:12.0, left: 12.0, right: 12.0),
          child: Container(
                        height: 70, 
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), 
                          color: const Color(0xFFBFC3FC).withOpacity(0.2)
                        ),
                        child: ListTile(
                          leading: Image.asset(topicsManager.courseTopics[index].videoThumbnail),
                          title: Text(topicsManager.courseTopics[index].title,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          subtitle: Text(topicsManager.courseTopics[index].subTitle),
                          trailing: Text('${topicsManager.courseTopics[index].duration} min',style: const TextStyle(color: Color(0xFFBFC3FC))),
                        ),
                                        ),
        );
      }))
     
    ],);
  }
}