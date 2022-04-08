import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/movie.dart';
import 'home_page.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  File _selectedImage = File('');

  String named = "";
  String genred = "";
  int yeard = 0;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update movies"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            children: [
              Container(
                child: _isLoading
                    ? Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
                    : Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: _selectedImage.path != ''
                            ? Container(
                          height: 150,
                          margin:
                          EdgeInsets.symmetric(horizontal: 16),
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.file(
                              _selectedImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                            : Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16),
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: const Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value != null) if (value.isEmpty) {
                            return "To'ldirilmagan";
                          }
                        },
                        onSaved: (value) {
                          named = movieItem as String;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Genre',
                        ),
                        validator: (value) {
                          if (value != null) if (value.isEmpty) {
                            return "To'ldirilmagan";
                          }
                        },
                        onSaved: (value) {
                          genred = value!;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Year',
                        ),
                        validator: (value) {
                          if (value != null) if (value.isEmpty) {
                            return "To'ldirilmagan";
                          }
                        },
                        onSaved: (value) {
                          yeard = int.parse(value!);
                        },
                      ),
                      SizedBox(height: 24),
                      TextButton(
                        onPressed: () {
                          updateMovie();
                        },
                        child: Text("Udate"),
                      )
                    ],
                  ))
            ],
          )),
    );
  }

  Widget movieItem(Autogenerated articles) {
    return Card(
      elevation: 12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            width: 180,
            height: 156,
            child: Image.network(
              "${HomePage.imageUrl}${Articles()}",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(articles.toString()),
                Text(articles.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }

  void updateMovie() {
    bool isValid = formKey.currentState!.validate();

    if (isValid) {
      formKey.currentState!.save();
      _update();
    }
  }

  void _update() async {
    setState(() {
      _isLoading = true;
    });
    var firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('movie_images')
    /*.child(_selectedImage.path)*/
        .child('$named.jpg');
    final task = firebaseStorageRef.putFile(_selectedImage);

    var downloadUrl = await (await task).ref.getDownloadURL();
    print('this is url $downloadUrl');

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore
          .collection('movies')
          .doc("${named.replaceAll(" ", "_")}_$yeard")
          .update({
        'name': named,
        'genre': genred,
        'year': yeard,
        'imageUrl': downloadUrl
      });

      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
