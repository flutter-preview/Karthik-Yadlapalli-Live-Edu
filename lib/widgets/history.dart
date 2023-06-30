
// ignore_for_file: use_key_in_widget_constructors


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants/edu_Icons.dart';
import '../app_constants/edu_colors.dart';
import '../providers/course_provider.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context ,WidgetRef ref) {
      final courseManager =  ref.watch(courseProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 18,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xFFBFC3FC).withOpacity(0.3),
            ),
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.bar_chart,color:  Color(0xFFBFC3FC)),
                    Padding(
                      padding: EdgeInsets.only(left:8.0),
                      child: Text('Time spent in app'),
                    )
                  ],
                ),
                const SizedBox(height: 18.0),
                SizedBox(
                  height: 170,
                  child: appTimeBarChart(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xFFBFC3FC).withOpacity(0.3),
            ),
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.bar_chart,color:  Color(0xFFBFC3FC)),
                    Padding(
                      padding: EdgeInsets.only(left:8.0),
                      child: Text('Passed Tests'),
                    )
                  ],
                ),
                const SizedBox(height: 18.0),
                SizedBox(
                  height: 170,
                  child: appTimeBarChart(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18,),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 18),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Recently Viewed",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: courseManager.courses.length,
                  itemBuilder: (ctx , index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Image.asset(courseManager.courses[index].imgThumbnail,height: 180, width: 180,),
                          Positioned(
                            top: 10, 
                            left: 10,
                            child: Container(
                            height: 20, 
                            width: 43,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.white),
                            child: Center(child: Row(
                              children: [
                                 Padding(
                                  padding:  const EdgeInsets.only(right:3.0),
                                  child: Icon(Icons.star,size:15,color: Colors.grey[400],),
                                ),
                                Text(courseManager.courses[index].rating.toString(),style: TextStyle(color: Colors.grey[500])),
                              ],
                            )),
                            
                            ))
                      
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(courseManager.courses[index].name, style: const TextStyle(fontSize: 18),),
                                Row(
                                  children: [
                                    const Icon(EduIcons.coin,size: 15,color: EduColors.optCoinColor,),
                                    const SizedBox(width: 3,),
                                    Text(courseManager.courses[index].price.toString())
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(courseManager.courses[index].descreption)
                        ],
                      ),
                    )
                  ],);
                }),
              )
            ]),
            )
         
        ],
      ),
    );
  }


  Widget appTimeBarChart(BuildContext context) {
    return  BarChart(
      BarChartData(
      // backgroundColor: const Color(0xFFBFC3FC).withOpacity(0.3),
      maxY: 15,
      minY: 0,
      baselineY: 0,
      // alignment: BarChartAlignment.spaceBetween,
      gridData: FlGridData(
        show: false
      ),
        borderData: FlBorderData(
          show: false,
            border: const Border(
          top: BorderSide.none,
          right: BorderSide.none,
          left: BorderSide.none,
          bottom: BorderSide.none,
        )),
        groupsSpace: 20,
        barGroups: [
            BarChartGroupData(x: 1, 
           
            barRods: [
            BarChartRodData(fromY: 0, toY: 10, width: 15, color: const Color(0xFFA2C3FC)),
          ]),
            BarChartGroupData(x: 2, barRods: [
            BarChartRodData(fromY: 0, toY: 10, width: 15, color:const Color(0xFFA2C3FC)),
          ]),
            BarChartGroupData(x: 3, barRods: [
            BarChartRodData(fromY: 0, toY: 15, width: 15, color: const Color(0xFFA2C3FC)),
          ]),
            BarChartGroupData(x: 4, barRods: [
            BarChartRodData(fromY: 0, toY: 10, width: 15, color: const Color(0xFFA2C3FC)),
          ]),
            BarChartGroupData(x: 5, barRods: [
            BarChartRodData(fromY: 0, toY: 12, width: 15, color: const Color(0xFFA2C3FC)),
          ]),
            BarChartGroupData(x: 6, barRods: [
            BarChartRodData(fromY: 0, toY: 10, width: 15, color: const Color(0xFFA2C3FC)),
          ]),
            BarChartGroupData(x: 7, barRods: [
            BarChartRodData(fromY: 0, toY: 13, width: 15, color: const Color(0xFFA2C3FC)),
          ]),
            BarChartGroupData(x: 8, barRods: [
            BarChartRodData(fromY: 0, toY: 14, width: 15, color: const Color(0xFFA2C3FC)),
          ]),
          BarChartGroupData(x: 9, barRods: [
            BarChartRodData(fromY: 0, toY: 6, width: 15, color: const Color(0xFFA2C3FC)),
          ]),
        ]));
        }
  }
