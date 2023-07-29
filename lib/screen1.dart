import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled2/widgets/widgets.dart';





class BookScreen extends StatefulWidget {
  @override
  _BookScreenState createState() => _BookScreenState();
}class _BookScreenState extends State<BookScreen> {
  List<dynamic> list2 = []; 
  var category = 'snow white';
  @override

  void initState(){
    super.initState();
    fetchBooks(category);
  }



   Future<void> fetchBooks(String category) async {
    
    final response = await http.get(
        Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$category'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        list2 = data['items'];
      });
    } else {
      setState(() {
        list2 = [];
      });
    }
  }  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books Mania'),
        leading: Icon(Icons.book),
        backgroundColor: Color.fromARGB(255, 185, 117, 216),
      ),
      body: 

       Column(
          children: [

            SizedBox(height: 20,),

             TextField(
         
              onChanged: (value1) {
                fetchBooks(value1);
              },
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), ),
                labelText: 'Search for News Topic ',suffixIcon:Icon(Icons.search,color: Colors.grey,),fillColor: Colors.amberAccent,
              ),
            ),

            SizedBox(height: 10,),

            Container(
              height: 200,width: MediaQuery.of(context).size.width,
              
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,mainAxisExtent:200), 
                itemCount: list2.length,
               scrollDirection: Axis.horizontal, 
                itemBuilder: (context, index) {
                   final book = list2[index]['volumeInfo'];
                   return Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black12,
                      image: DecorationImage(image:NetworkImage(book['imageLinks']['smallThumbnail'],
                      ),fit:BoxFit.fill)
                    ),

                
                   );

                  
                },),),
        
           SizedBox(height: 20,),
            
            Container(
              child:Row(
                children: [
                  SizedBox(height: 10,),container1("Fantasy"),
                  SizedBox(width: 10,),container1("Horror"),
                  SizedBox(width: 10,),container1("Comic"),
                  SizedBox(width: 10,),container1("Science"),
                ],
              ),),
      

            SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(
                itemCount: list2.length,
                itemBuilder: (context, index) {
                  final book = list2[index]['volumeInfo'];
                  return ListTile(
                    leading: Image.network(
                      book['imageLinks']['smallThumbnail'],
                    ),
                    title: Text(book['title']),
                    subtitle: Text(book['authors'] != null
                        ? book['authors'][0]
                        : 'Author not available'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  bookdetailsScreen(bookdetails: book),
                  ),
                );
              },
                  );
                },
              ),
            ),
          ],
        ),
      
    );
  }
}



class bookdetailsScreen extends StatelessWidget {

final bookdetails ;

  bookdetailsScreen({required this.bookdetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 148, 206),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 197, 148, 206),
          leading:  Icon(
            Icons.arrow_back_ios,
            color:  Colors.white, 
          ),
          title: 
            bodytxt("Books Details ", 25, FontWeight.bold, Colors.white),

          ),
      body: 
        SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
        
            child:  Column(children: [
              
              Container(height: 200,width: 200,
                child: Image.network(bookdetails['imageLinks']!=null && 
                      bookdetails['imageLinks']['smallThumbnail'] != null 
                      ? bookdetails['imageLinks']['smallThumbnail']
                      : 'https://m.media-amazon.com/images/I/710GgrTea1L._AC_UY218_.jpg',
                fit: BoxFit.fill),
              ),
              SizedBox(height: 30),
              
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration:BoxDecoration(borderRadius: 
                BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 10),
                   child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                          
                bodytxt(bookdetails['title']!=null ? bookdetails['title']: "", 20, FontWeight.w800,Color.fromARGB(255, 197, 148, 206)),
                      
                        
                Divider(height: 20,color: Color.fromARGB(255, 223, 220, 220),thickness: 2.0),
                      
                const SizedBox(height: 8),
                 
                bodytxt(bookdetails['authors']!=null?bookdetails['authors'][0]:"", 16, FontWeight.w700, Color.fromARGB(255, 255, 198, 76)),
                const SizedBox(height: 10),
                         
                Expanded(child: 
                bodytxt(bookdetails['description']!=null ? bookdetails['description']: "", 15, FontWeight.w700,Color.fromARGB(255, 197, 148, 206) )),
                      
                Divider(height: 20,color: Color.fromARGB(255, 223, 220, 220),thickness: 2.0),
                      
                         ],),),
              ),
        
        ],), ),
        ), ); }}









