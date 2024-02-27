import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [];
  Future<void> fetchData() async {
    final res = await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
    print(res.statusCode);

    setState(() {
      data = jsonDecode(res.body)['data'];
    });
    print(data);

  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
         IconButton(onPressed: (){
          setState(() {
            data +=[{
            "id":data.length+1,
            "email":"eve.holt@reqres.in",
            "first_name":"Lucifer",
            "last_name":"Morning Star",
            "avatar":"https://reqres.in/img/faces/3-image.jpg"
           } ];
          });
         }, icon: Icon(Icons.add,color: Colors.white,))
        ],
        title: Text(
          "Flutter Api",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context , index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Container(
                height:100,
                color: const Color.fromARGB(255, 145, 141, 155),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(data[index]['avatar']),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           data[index]['email'],
                           
                           softWrap: true,
                            style: const TextStyle(fontSize: 19, color: Colors.black,fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 8),
                          Text(
                            
                            data[index]['first_name'] + data[index]['last_name'],
                            style: const TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                               
                          ),
                         
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(onPressed: (){
                        setState(() {
                           data.removeWhere((element) =>
                                      element['id'] == data[index]['id']);
                        });
                                  
                          }, icon: Icon(Icons.delete,color: Colors.red,))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

