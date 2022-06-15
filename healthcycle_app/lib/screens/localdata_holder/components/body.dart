import 'dart:io';

import 'package:healthcycle_app/screens/home/home_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const LocalDataHolder();
  }
}

class LocalDataHolder extends StatefulWidget {
  const LocalDataHolder({Key? key}) : super(key: key);

  @override
  State<LocalDataHolder> createState() => _LocalDataHolderState();
}

class _LocalDataHolderState extends State<LocalDataHolder> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
          elevation: 0.0,
          backgroundColor: const Color(0xFF39285A),
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg",
                color: Colors.white),
            onPressed: () {textController.clear();
            },
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<List<DataHolder>>(
                future: DatabaseHelper.instance.getDataHolders(),
                builder: (BuildContext context, AsyncSnapshot<List<DataHolder>> snapshot){
                  if(!snapshot.hasData){
                    return Center(child: Text('LOADING...'));
                  }
                  return snapshot.data!.isEmpty
                      ? Center(child: Text('NO DATA FOUND'),)
                      :ListView(
                    children: snapshot.data!.map((dataholder) {
                      return Center(
                        child: ListTile(
                            title: Text(dataholder.name),
                            onLongPress:() {
                              setState(() {
                                DatabaseHelper.instance.remove(dataholder.id!);
                              });
                            }
                        ),
                      );
                    }).toList(),
                  );
                }
            )
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () async {
            await DatabaseHelper.instance.add(
              DataHolder(name: textController.text),
            );
            setState(() {
              textController.clear();
            });
          },
        ),
      ),
    );
  }
}

class DataHolder {
  final int? id;
  final String name;

  DataHolder({this.id, required this.name});

  factory DataHolder.fromMap(Map<String, dynamic> json) => new DataHolder(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name': name,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path,'dataholders.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE dataholders(
    id INTEGER PRIMARY KEY,
    name TEXT
    )
    ''');
  }
  
  Future<List<DataHolder>> getDataHolders() async {
    Database db = await instance.database;
    var datahodlers = await db.query('dataholders',orderBy: 'name');
    List<DataHolder> dataholderList = datahodlers.isNotEmpty
    ? datahodlers.map((e) => DataHolder.fromMap(e)).toList()
        : [];
    return dataholderList;
  }

  Future<int> add(DataHolder dataHolder) async {
    Database db = await instance.database;
    return await db.insert('dataholders', dataHolder.toMap());
  }

  Future<int>remove(int id)async{
    Database db=await instance.database;
    return await db.delete('dataholders',where:'id=?',whereArgs:[id]);
  }

  Future<int>update(DataHolder dataHolder)async{
    Database db=await instance.database;
    return await db.update('dataholders',dataHolder.toMap(),where:'id=?',whereArgs:[dataHolder.id]);
  }
}
