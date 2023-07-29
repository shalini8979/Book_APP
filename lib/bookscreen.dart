import 'package:flutter/material.dart';
import 'package:untitled2/screen1.dart';



class newScreen extends StatefulWidget {

  @override
  State<newScreen> createState() => _newScreenState();
}

class _newScreenState extends State<newScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
             bottomOpacity: 0,
             backgroundColor:Color.fromARGB(255, 224, 152, 221),
             title: Text('Books Library '),

      ),
      body: SingleChildScrollView(
        child: Column(
      
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 500,decoration:  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width,
            
              child:
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNbhjc8SlAV9MUWhJGWXPZzQIjJYG13GsDMw&usqp=CAU",fit: BoxFit.fill,),),
      
            SizedBox(height: 10,),
            
            Column(children: [
      
              Padding(padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
            child:
            Text("Books from around the world for you ",style: TextStyle(color: Colors.yellow,fontSize: 25,fontWeight: FontWeight.bold),),
            
            ),
            SizedBox(height: 3,),
             Padding(padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 15),child:
            Text("Best time to read , take your time to read a little more of this world ", style: TextStyle(color: Color.fromARGB(255,224,152,234),fontSize: 20.0),),
             ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: ElevatedButton(style: ButtonStyle(animationDuration: Duration(seconds: 5),), onPressed: (){
                
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
      
                      BookScreen(),
                          
                    ),
                  );
                  
                print("going to url");
      
              }, 
              child: Text("Get Started ")),),],)
      
          ],
        ),
        ],
        ),
      ),
    );
  }
}