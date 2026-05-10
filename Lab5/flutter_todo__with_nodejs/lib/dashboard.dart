import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginPage.dart';

class Dashboard extends StatefulWidget {
  final token;
  const Dashboard({@required this.token,Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  late SharedPreferences prefs;
  late String userId;
  TextEditingController _todoTitle = TextEditingController();
  TextEditingController _todoDesc = TextEditingController();
  List? items;
  
  @override
  void initState() {
    super.initState();
    initSharedPref();
    try {
      Map<String,dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
      userId = jwtDecodedToken['userId'] ?? '';
      getTodoList(userId);
    } catch (e) {
      print('Error decoding token: $e');
      userId = '';
    }
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }

  void addTodo() async{
    if(_todoTitle.text.isNotEmpty && _todoDesc.text.isNotEmpty){

      var regBody = {
        "title":_todoTitle.text,
        "desc":_todoDesc.text
      };

      try {
        var response = await http.post(Uri.parse(addtodo),
            headers: {
              "Content-Type":"application/json",
              "Authorization": widget.token
            },
            body: jsonEncode(regBody)
        );

        var jsonResponse = jsonDecode(response.body);

        print(jsonResponse['success']);

        if(jsonResponse['success'] == true){
          _todoDesc.clear();
          _todoTitle.clear();
          Navigator.pop(context);
          getTodoList(userId);
        }else{
          print("Add todo failed: ${jsonResponse['message']}");
        }
      } catch (e) {
        print('Error adding todo: $e');
      }
    }
  }

  void getTodoList(userId) async {
    try {
      var response = await http.get(
        Uri.parse(getToDoList),
        headers: {
          "Content-Type":"application/json",
          "Authorization": widget.token
        },
      );

      var jsonResponse = jsonDecode(response.body);
      if(jsonResponse['success'] == true) {
        items = jsonResponse['todos'];
      } else {
        items = [];
      }

      setState(() {});
    } catch (e) {
      print('Error getting todos: $e');
      items = [];
      setState(() {});
    }
  }

  void deleteItem(id) async{
    var regBody = {
      "id":id
    };

    try {
      var response = await http.post(Uri.parse(deleteTodo),
          headers: {
            "Content-Type":"application/json",
            "Authorization": widget.token
          },
          body: jsonEncode(regBody)
      );

      var jsonResponse = jsonDecode(response.body);
      if(jsonResponse['success'] == true){
        getTodoList(userId);
      }
    } catch (e) {
      print('Error deleting todo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             padding: EdgeInsets.only(top: 60.0,left: 30.0,right: 30.0,bottom: 30.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     CircleAvatar(
                       child: Icon(Icons.list,size: 30.0,),
                       backgroundColor: Colors.white,
                       radius: 30.0,
                     ),
                     PopupMenuButton(
                       icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
                       itemBuilder: (context) => [
                         PopupMenuItem(
                           child: ListTile(
                             leading: Icon(Icons.logout),
                             title: Text('Sign Out'),
                             contentPadding: EdgeInsets.zero,
                           ),
                           value: 'logout',
                         ),
                       ],
                       onSelected: (value) {
                         if (value == 'logout') {
                           signOut();
                         }
                       },
                     ),
                   ],
                 ),
                 SizedBox(height: 10.0),
                 Text('ToDo with NodeJS + Mongodb',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w700),),
                 SizedBox(height: 8.0),
                 Text('${items?.length ?? 0} Task${(items?.length ?? 0) != 1 ? 's' : ''}',style: TextStyle(fontSize: 20),),

               ],
             ),
           ),
           Expanded(
             child: Container(
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
               ),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: items == null ? null : ListView.builder(
                     itemCount: items!.length,
                     itemBuilder: (context,int index){
                       return Slidable(
                         key: const ValueKey(0),
                         endActionPane: ActionPane(
                           motion: const ScrollMotion(),
                           dismissible: DismissiblePane(onDismissed: () {}),
                           children: [
                             SlidableAction(
                               backgroundColor: Color(0xFFFE4A49),
                               foregroundColor: Colors.white,
                               icon: Icons.delete,
                               label: 'Delete',
                               onPressed: (BuildContext context) {
                                 print('${items![index]['_id']}');
                                 deleteItem('${items![index]['_id']}');
                               },
                             ),
                           ],
                         ),
                         child: Card(
                           borderOnForeground: false,
                           child: ListTile(
                             leading: Icon(Icons.task),
                             title: Text('${items![index]['title']}'),
                             subtitle: Text('${items![index]['desc']}'),
                             trailing: Icon(Icons.arrow_back),
                           ),
                         ),
                       );
                     }
                 ),
               ),
             ),
           )
         ],
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>_displayTextInputDialog(context) ,
        child: Icon(Icons.add),
        tooltip: 'Add-ToDo',
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add To-Do'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _todoTitle,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Title",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                ).p4().px8(),
                TextField(
                  controller: _todoDesc,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Description",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                ).p4().px8(),
                ElevatedButton(onPressed: (){
                  addTodo();
                  }, child: Text("Add"))
              ],
            )
          );
        });
  }
}

