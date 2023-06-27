import 'package:flutter/material.dart';
import '../app_constants/edu_colors.dart'; 

class PageButton extends StatelessWidget {
  PageButton({super.key,required this.buttonText, required this.buttonTap});
  String buttonText;
  final void Function() buttonTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
                        onTap: buttonTap,
                        child: Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: EduColors.primaryGradient,
                          ),
                          child:  Center(
                              child: Text(
                            buttonText,
                            style: const TextStyle(fontSize: 20),
                          )),
                        ),
                      );
  }
}
