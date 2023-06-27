import 'package:flutter/material.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map<String , dynamic>> imgStrings =[
   {"Elementry": "asstes/illustrations/svgviewer-output (1) copy.png"},
   {"Advanced": "asstes/illustrations/svgviewer-output copy.png"},
   {"Por": "asstes/illustrations/svgviewer-output (1) copy.png"},
   {"Elite": "asstes/illustrations/svgviewer-output copy.png"},
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 5,
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left:16.0 , top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:10.0, horizontal:8.0),
                  child: Text("Courses",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),
                
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imgStrings.length,
                    itemBuilder: (ctx , index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(imgStrings[index].values.first,height: 180, width: 180,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:18.0),
                        child: Text(imgStrings[index].keys.first, style: TextStyle(fontSize: 18),),
                      )
                    ],);
                  }),
                )
            
              ]),
            ),
            
          ),
        ),
        SizedBox()

      ],
    );
  }
}