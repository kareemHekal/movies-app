import 'package:flutter/material.dart';

class categoryCard extends StatelessWidget {
  String? name;

  categoryCard({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 90,
        width: 158,
        child: Stack(
          children: [
            Image.asset("assets/images/action.jpg",height: 90,width: 158,),
            Center(child: Text(name??'',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),)),
          ],
        ),
      ),
    );
  }
}
