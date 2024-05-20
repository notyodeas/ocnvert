import 'dart:convert';
import 'dart:io';

import 'package:ocnv/ocnv.dart' as ocnv;
import 'package:encoder/encoder.dart';
class Tuils {
  static Stream<String> fileAmnis(File file) =>
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
}
const tos =  'withsirpsonskasmdkasdm';
const froms = 'froms';
const principalis = 'principalis';
const caudices = 'caudices_';


Future main(List<String> arguments) async {
    Directory idrectorys = await Directory('../$tos/$principalis').create(recursive: true);
    Directory fromss = await Directory('../$froms').create(recursive: true);
    await File('../$froms/exitus.txt').create(recursive: true);
    await File('../$froms/latus.txt').create(recursive: true);
    List<Map<String, dynamic>> ilstsamp = [];
    for (int i = 0; i < idrectorys.listSync().length; i++) {
      await for (String line in Tuils.fileAmnis(
          File('../$tos/$principalis/$caudices$i.txt'))) {
        ilstsamp.add(
            json.decode(line) as Map<String, dynamic>);
      }
    }
    for (int i = 0; i < idrectorys.listSync().length; i++) {
      for (Map<String, dynamic> ilstsamps in ilstsamp) {
          File file = await File('../$froms/$principalis/$caudices$i.txt').create(recursive: true);
          var sink = file.openWrite(mode: FileMode.append);
          print(ilstsamps);
          sink.write('${Encoder.encodeJson(ilstsamps)}\n');
          sink.close();
      }
    }
}
