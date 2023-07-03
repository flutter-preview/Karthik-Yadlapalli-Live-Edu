import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' ;
import 'package:live_edu/app_constants/edu_Icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void logout(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:18.0, left:12.0, right:18.0),
      child: Column(children: [
        ListTile(
          leading: Container(
            height: 50, 
            width: 50,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:const Color(0xFFBFC3FC).withOpacity(0.3)),
            child: const Icon(Icons.person_outline,color: Colors.black,size: 30,)),
          title: const Text('Personal Information',style: TextStyle(fontSize: 20),),
        ),
        ListTile(
          leading: Container(
            height: 50, 
            width: 50,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:const Color(0xFFBFC3FC).withOpacity(0.3)),
            child: const Icon(EduIcons.transactions,color: Colors.black,size: 30,)),
          title: const Text('Transaction History',style: TextStyle(fontSize: 20),),
        ),
        ListTile(
          leading: Container(
            height: 50, 
            width: 50,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:const Color(0xFFBFC3FC).withOpacity(0.3)),
            child: const Icon(EduIcons.payment,color: Colors.black,size: 30,)),
          title: const Text('Payment',style: TextStyle(fontSize: 20),),
        ),
        ListTile(
          leading: Container(
            height: 50, 
            width: 50,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:const Color(0xFFBFC3FC).withOpacity(0.3)),
            child: const Icon(EduIcons.terms,color: Colors.black,size: 30,)),
          title: const Text('Terms of use',style: TextStyle(fontSize: 20),),
        ),
        ListTile(
          leading: Container(
            height: 50, 
            width: 50,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:const Color(0xFFBFC3FC).withOpacity(0.3)),
            child: const Icon(EduIcons.support,color: Colors.black,size: 30,)),
          title: const Text('Support',style: TextStyle(fontSize: 20),),
        ),
         GestureDetector(
          onTap: logout,
           child: ListTile(
            leading: Container(
              height: 50, 
              width: 50,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:const Color(0xFFBFC3FC).withOpacity(0.3)),
              child: const Icon(Icons.logout_rounded,color: Colors.black,size: 30,)),
            title: const Text('Logout',style: TextStyle(fontSize: 20),),
                 ),
         ),
       
      ],),
    );
  }
}