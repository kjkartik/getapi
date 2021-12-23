import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse(
        "http://saloonapi.vfastdelivery.in/Api/Rebliss/GetMarkAttendanceUserInfo/0");
    var response = await http.get(url);
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        print('enter in set state');
        users = items;
        isLoading = false;
      });
    } else {
      print('enter in  else');
      users = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listing Users"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (users.contains(null) || users.length < 0 || isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  Widget getCard(item) {
    // var fullName = item['name']['title'] +
    //     " " +
    //     item['name']['first'] +
    //     " " +
    //     item['name']['last'];
    // var email = item['email'];
    var profileUrl = item['Designation']['Banner'];
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 140,
                    // child: Text(
                    //   fullName,
                    //   style: TextStyle(fontSize: 17),
                  ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   email.toString(),
                  //   style: TextStyle(color: Colors.grey),
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
