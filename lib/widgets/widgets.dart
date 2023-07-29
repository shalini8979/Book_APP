import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget container1(text1){

  return Container(
    height: 42,width: 80,decoration: 
    BoxDecoration(borderRadius: BorderRadius.circular(20),
    color: Color.fromARGB(255, 185, 117, 216)
    
    ),
    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: Text(text1,style: TextStyle(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold),),
  );
}


Widget container2(String imgurl) => Padding(
  padding: const EdgeInsets.all(5.0),
  child: Container(
    width: 320,
    height: 230,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imgurl,
        fit: BoxFit.fill,
      ),
    ),
  ),
);



Widget  bodytxt( txtbody1,fontsize1,fontweight1,color1,)=> Text(
              txtbody1,
              style: GoogleFonts.poppins(
                fontSize: fontsize1,
                fontWeight: fontweight1,
                color: color1,
              ),
   );
   