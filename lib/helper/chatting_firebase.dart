import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

// void addMessageClient(String sender, String description) {
//   DateTime dateTimeNow = DateTime.now();
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   final getSender = sender.substring(0, 10);

//   Uri url = Uri.parse(
//       'https://chatapp1-angger-default-rtdb.asia-southeast1.firebasedatabase.app/$getSender.json');

//   http.post(url,
//       body: jsonEncode({
//         'name': sender,
//         'description': description,
//         'time': dateTimeNow.toString()
//       }));
// }

// Future<void> getMessageClient() async {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final getSender = auth.currentUser!.email.toString().substring(0, 10);

//   Uri url = Uri.parse(
//       'https://chatapp1-angger-default-rtdb.asia-southeast1.firebasedatabase.app/$getSender.json');

//   http.get(url).then((value) {
//     var dataresponse = jsonDecode(value.body) as Map<String, dynamic>;
//     dataresponse.forEach((key, value) {
//       var dateTimeParse = DateTime.parse(value['time']);
//       print(value['name']);
//       print(value['description']);
//       print(value['time']);
//       if (value['name'] == auth.currentUser!.email.toString()) {
//       } else {}
//     });
//     print(dataresponse);
//   });
// }

// List messageClient = [];
// List widgetMessageClient = [];

// Future<void> readRealtimeFirebase() async {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final getSender = auth.currentUser!.email.toString().substring(0, 10);

//   Uri url = Uri.parse(
//       'https://chatapp1-angger-default-rtdb.asia-southeast1.firebasedatabase.app/$getSender.json');

//   return http.get(url).then((value) {
//     var dataresponse = jsonDecode(value.body) as Map<String, dynamic>;
//     dataresponse.forEach((key, value) {
//       var dateTimeParse = DateTime.parse(value['time']);
//       print(value['name']);
//       print(value['description']);
//       print(value['time']);
//       if (value['name'] == auth.currentUser!.email.toString()) {
//         messageClient.add({
//           'name': value['name'],
//           'description': value['description'],
//           'time': dateTimeParse,
//           'key': key,
//           'type': 'send'
//         });
//         widgetMessageClient.add(MessageOwnTile(
//           message: value['description'],
//           messageDate: dateTimeParse.toString(),
//         ));
//       } else {
//         messageClient.add({
//           'name': value['name'],
//           'description': value['description'],
//           'time': dateTimeParse,
//           'key': key,
//           'type': 'receive'
//         });
//         widgetMessageClient.add(MessageTile(
//           message: value['description'],
//           messageDate: dateTimeParse.toString(),
//         ));
//       }
//     });
//     print(widgetMessageClient);
//   });
// }

void sendMessageData(String description) {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final getSender = auth.currentUser!.email.toString();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference message =
      firestore.collection('User').doc(getSender).collection('Message');
  if (getSender == 'anggerrakasanjayapamungkas@hmail.com') {
    message.add({
      'name': getSender,
      'message_from': 'admin',
      'description': description,
      'time': DateTime.now(),
    });
  } else {
    message.add({
      'name': getSender,
      'message_from': 'client',
      'description': description,
      'time': DateTime.now(),
    });
  }
}

class DatabaseService {
  static Future<String> uploadImage(File imageFile) async {
    String fileName = basename(imageFile.path);

    final storageRef = FirebaseStorage.instance.ref().child(fileName);
    final uploadTask = storageRef.putFile(imageFile);
    final taskSnapshot = await uploadTask;
    final urlDownload = await taskSnapshot.ref.getDownloadURL();
    return urlDownload;
  }

  static Future<String> deleteImage(String url) async {
    final storageRef = FirebaseStorage.instance.refFromURL(url);
    await storageRef.delete();
    return 'success';
  }

  static Future<String> editImage(File image) async {
    String fileName = basename(image.path);
    final storageRef = FirebaseStorage.instance.ref().child(fileName);
    final uploadTask = storageRef.putFile(image);
    final taskSnapshot = await uploadTask;
    final urlDownload = await taskSnapshot.ref.getDownloadURL();
    return urlDownload;
  }

  static void sendProduct(
    String nameProdut,
    int priceProduct,
    String description,
    String? imageProduct,
  ) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final getSender = auth.currentUser!.email.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products =
        firestore.collection('User').doc(getSender).collection('Product');
    products.add({
      'name': getSender,
      'product': nameProdut,
      'price': priceProduct,
      'description': description,
      'status': 'Pending',
      'image': imageProduct,
      'time': DateTime.now(),
    });
  }

  static void createUserProfile(
    String firstName,
    String lastName,
    String phone,
    String address,
  ) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final getSender = auth.currentUser!.email.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference user =
        firestore.collection('User').doc(getSender).collection('Profile');
    user.add({
      'first': firstName,
      'last name': lastName,
      'phone': phone,
      'address': address,
      'time': DateTime.now(),
    });
  }
}
