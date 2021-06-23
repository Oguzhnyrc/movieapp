
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class file with ChangeNotifier{
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  //Yukarıdaki fonksiyon sayesinde pubspec.yaml’de tanıtmış olduğumuz kütüphane
  // ışığında programın çalıştığı dosya yolunu bir string olarak döndürüyoruz.

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/yazılacakdata.txt');
  }
  //Yukarıdaki fonksiyon sayesinde okumak istediğimiz dosyayıbir File object olarak döndürüyoruz.
  // Programın dosyalarının bulunduğu klasörde teknotraFavoriler.txt adı ve formatında bir dosya
  // döndürüyorum.

  Future<String> readFile() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "-1";
    }
  }
  //Yukarıdaki fonksiyonda dosya yolu belirlenen dosyayı bir string okuma yöntemi ile okuyorum.
  // Okuma işlemim sırasında herhangi bir problem oluşursa fonksiyon sonucu olarak -1 oluşmaz ise
  // dosyanın içeriğini döndürüyorum.

  Future<File> writeFile(String data) async {
    final file = await _localFile;
    return file.writeAsString('$data');
  }
}