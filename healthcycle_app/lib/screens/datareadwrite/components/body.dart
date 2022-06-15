import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const DataReadWrite();
  }
}

class DataReadWrite extends StatefulWidget {
  const DataReadWrite({Key? key}) : super(key: key);

  @override
  State<DataReadWrite> createState() => _DataReadWriteState();
}

class _DataReadWriteState extends State<DataReadWrite> {

  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "     A healthy diet is a diet that maintains or improves overall health. A healthy diet provides the body with essential nutrition: fluid, macronutrients such as protein, micronutrients such as vitamins, and adequate fibre and food energy.[2][3]A healthy diet may contain fruits, vegetables, and whole grains, and may include little to no processed food or sweetened beverages. The requirements for a healthy diet can be met from a variety of plant-based and animal-based foods, although a non-plant source of vitamin B12 is needed for those following a vegan diet.[4] Various nutrition guides are published by medical and governmental institutions to educate individuals on what they should be eating to be healthy. Nutrition facts labels are also mandatory in some countries to allow consumers to choose between foods based on the components relevant to health.",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 20,
                        color: Colors.deepPurpleAccent, letterSpacing: .5),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    child: Text('Download & Open'),
                    onPressed: () => openFile(url:'https://apps.who.int/iris/bitstream/handle/10665/325828/EMROPUB_2019_en_23536.pdf',
                        fileName: 'healtydiet.pdf'),
                   )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async{
   final file = await downloadFile(url, fileName!);
   // final file = await pickFile();
   if(file == null) return;

   if (kDebugMode) {
     print('Path: ${file.path}');
   }

   OpenFile.open(file.path);
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return null;

    return File(result.files.first.path!);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
try{
    final response = await Dio().get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        receiveTimeout: 0,
      )
    );

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;}
    catch(e) {
  return null;
    }

  }
}
