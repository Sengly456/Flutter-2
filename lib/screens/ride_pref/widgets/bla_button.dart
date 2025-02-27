import 'package:flutter/material.dart';

enum BlaButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  // Properties of the button
  final String label; // The text displayed on the button
  final IconData? icon; // Optional icon
  final VoidCallback onPressed; // Function to execute when pressed
  final BlaButtonType type; // Type of button: primary or secondary

  // Constructor with required and optional parameters
  const BlaButton({
    super.key,
    required this.label, // The button must have a label
    this.icon, // Icon is optional
    required this.onPressed, // The button must have an action
    this.type = BlaButtonType.primary, // Default type is primary
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    Color iconColor;
    //logic for button style
    switch (type) {
      case BlaButtonType.primary:
        backgroundColor = Colors.blue; // Primary button background color
        textColor = Colors.white; // Primary button text color
        iconColor = Colors.white; // Primary button icon color
        break;
      case BlaButtonType.secondary:
        backgroundColor = Colors.white; // Secondary button background color
        textColor = Colors.blue; // Secondary button text color
        iconColor = Colors.blue; // Secondary button icon color
        break;
    }
    return ElevatedButton.icon(
      onPressed:onPressed,// Button action
      icon: icon!=null
      ? Icon(icon,color:iconColor) //show icon
      :const SizedBox.shrink(),//if not use an empty space

      label:Text(
        label,
        style: TextStyle(color: textColor),//set color
      ),
      style:ElevatedButton.styleFrom(
        //styling 
        backgroundColor:backgroundColor,
        padding:const EdgeInsets.symmetric(horizontal:20,vertical:12), 
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
      ) ,
      
    );
  }
}
