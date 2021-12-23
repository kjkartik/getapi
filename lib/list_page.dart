import 'dart:convert';
import 'dart:io';

import 'package:api/repositery.dart';
import 'package:api/service.dart';
import 'package:flutter/material.dart';
import 'model_class.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<List<dynamic>> modelClass;
  final repositery = Repositery();
  final Httpserver = HttpServers();

  void initState() {
    super.initState();
    var gethttp = repositery.getDataHttp();
    modelClass = gethttp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(32, 41, 57, 10),
        title: Text('api'),
      ),
      body: FutureBuilder<List<dynamic>?>(
          future: Httpserver.getMethod(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.toString);
              return ListView.builder(
                itemCount: modelClass.length,
                itemBuilder: (context, index) {
                  ModelClass list = modelClass[index];
                  if (snapshot.hasData) {
                    return Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60 / 2),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(list.Designation))));
                  } else if (snapshot.hasError) {
                    return Container(
                      child: const Center(
                          child: Text("fff"
                              // snapshot.error.toString()
                              )),
                    );
                  }
                  return const Center(
                    child: Text('No Data'),
                  );
                },
              );
            } else if (snapshot.data?.length == 0) {
              return Center(
                child: Text(' No Post Available'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                if (snapshot.hasData) {
                  return ListTile(
                    title: Text("ddd"
                        // snapshot.data.toString()
                        ),
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    child: Center(
                        child: Text("fff"
                            // snapshot.error.toString()
                            )),
                  );
                }
                return const Center(
                  child: Text('No Data'),
                );
              },
            );
          }),
    );
  }
}
