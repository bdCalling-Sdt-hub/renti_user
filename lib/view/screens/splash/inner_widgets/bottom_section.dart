
import 'package:flutter/material.dart';

class BottomSection extends StatefulWidget {
  const BottomSection({super.key});

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

  class _BottomSectionState extends State<BottomSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){

          },
          child:const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('English',style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 16,fontWeight: FontWeight.w400,),),
              SizedBox(width: 12,),
              Icon(Icons.arrow_forward_ios_outlined,color: Color(0xFFFFFFFF),size: 12,)
            ],
          ),
        ),
        const SizedBox(height: 24,),
        SizedBox(
          height: 57,
          width: MediaQuery.of(context). size.width,
          child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
                backgroundColor: Color(0xFFFFFFFF),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(color: Color(0xff000B90),fontSize: 18,fontWeight: FontWeight.w600),
              )),
        ),
      ],
    );
  }
}