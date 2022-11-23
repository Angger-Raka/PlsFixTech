import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './client.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

void main() {
  runApp(MyApp());
  addDataRealtime('angger', 'test1');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void addDataRealtime(String name, String Keterangan) {
  DateTime dateTimeNow = DateTime.now();

  Uri url = Uri.parse(
      'https://chatapp1-angger-default-rtdb.asia-southeast1.firebasedatabase.app/client1.json');

  http.post(url,
      body: jsonEncode({
        'nama': name,
        'keterangan': Keterangan,
        'Waktu': dateTimeNow.toString()
      }));
}

///////////////////////////////////////////////
class client with ChangeNotifier {
  List<Client> _allPlayer = [];

  List<Client> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  Client selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  Future<void> addPlayer(String name, String position, String image) {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://http-req-bec2d-default-rtdb.firebaseio.com/players.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          "name": name,
          "position": position,
          "imageUrl": image,
          "createdAt": datetimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        print("THEN FUNCTION");
        _allPlayer.add(
          Client(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            description: position,
            time: datetimeNow,
          ),
        );

        notifyListeners();
      },
    );
  }

  Future<void> deletePlayer(String id) {
    Uri url = Uri.parse(
        "https://http-req-bec2d-default-rtdb.firebaseio.com/players/$id.json");
    return http.delete(url).then(
      (response) {
        _allPlayer.removeWhere((element) => element.id == id);
        notifyListeners();
      },
    );
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://http-req-bec2d-default-rtdb.firebaseio.com/players.json");

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;

    dataResponse.forEach(
      (key, value) {
        DateTime dateTimeParse = DateTime.parse(value["createdAt"]);
        _allPlayer.add(
          Client(
            id: key,
            name: value["name"],
            time: dateTimeParse,
            description: value['description'],
          ),
        );
      },
    );
    print("BERHASIL MASUKAN DATA LIST");

    notifyListeners();
  }
}
