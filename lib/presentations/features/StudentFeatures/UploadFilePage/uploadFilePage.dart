import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mustafa0_1/Theme/AppThemeData.dart';
import 'package:mustafa0_1/presentations/features/StudentFeatures/UploadFilePage/bloc/upload_file_bloc.dart';
import 'package:path/path.dart';

class UploadFilePageUI extends StatefulWidget {
  final int homeworkSeq;

  const UploadFilePageUI({Key key, this.homeworkSeq}) : super(key: key);
  @override
  _UploadFilePageUIState createState() => _UploadFilePageUIState();
}

class _UploadFilePageUIState extends State<UploadFilePageUI> {
  File file;

  List<File> _paths = [];

  FileType _pickingType = FileType.any;

  void _openFileExplorer() async {
    try {
      FilePickerResult result = await FilePicker.platform
          .pickFiles(type: _pickingType, allowMultiple: false);

      if (result != null) {
        file = File(result.files.single.path);
        _paths.add(file);
        setState(() {});
      } else {
        // User canceled the picker
        print("null result");
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }

    if (!mounted) return;
  }

  void openImageExplorer() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    if (image != null) {
      _paths.add(image);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppThemeData().primaryColor,
        centerTitle: true,
        title: Text(
          "GT Series",
          style: AppThemeData().lexendDecaText.copyWith(color: Colors.white),
        ),
      ),
      backgroundColor: AppThemeData().primaryColor,
      body: BlocBuilder<UploadFileBloc, UploadFileState>(
        builder: (context, state) {
          if (state is UploadFileLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UploadFileSuccessful) {
            return Center(
              child: Text(
                "تم الرفع بنجاح",
                style: AppThemeData()
                    .tajwalText
                    .copyWith(color: Colors.white, fontSize: 22),
              ),
            );
          }
          if (state is UploadFileFailed) {
            return Center(
              child: Text(
                "فشل في رفع الملفات",
                style: AppThemeData()
                    .tajwalText
                    .copyWith(color: Colors.white, fontSize: 22),
              ),
            );
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => {openImageExplorer()},
                    child: const Text(" رفع صورة"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        {_pickingType = FileType.any, _openFileExplorer()},
                    child: const Text("رفع ملف"),
                  ),
                ],
              ),
              _paths.length != 0
                  ? ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<UploadFileBloc>(context)
                            .add(UploadEvent(_paths, widget.homeworkSeq));
                      },
                      child: const Text("تسليم الملفات"),
                    )
                  : Container(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Container(
                    child: ListView.builder(
                        itemCount: _paths.length,
                        itemBuilder: (context, index) {
                          return fileRow(basename(_paths[index].path), index);
                        }),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget fileRow(String name, int index) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                _paths.removeAt(index);
                setState(() {});
              },
              child: Icon(
                Icons.cancel,
                color: Colors.white,
              )),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              name,
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.clip,
            ),
          )
        ],
      ),
    );
  }
}
