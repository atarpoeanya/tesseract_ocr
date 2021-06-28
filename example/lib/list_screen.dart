import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tesseract_ocr/tesseract_ocr.dart';
import 'package:tesseract_ocr/pos_tagger.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool _scanning = false;
  String _extractText = '';
  int _scanTime = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Scrabble Scramble",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Select image'),
                  onPressed: () async {
                    var file = await FilePicker.getFilePath(type: FileType.image);
                    _scanning = true;
                    setState(() {});

                    var watch = Stopwatch()..start();
                    var _extractTextOcr = await TesseractOcr.extractText(file);
                    _extractText = await PosTagger.tagText(_extractTextOcr);
                    _scanTime = watch.elapsedMilliseconds;

                    _scanning = false;
                    setState(() {});
                  },
                ),
                // It doesn't spin, because scanning hangs thread for now
                _scanning
                    ? SpinKitCircle(
                        color: Colors.black,
                      )
                    : Icon(Icons.done),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Scanning took $_scanTime ms',
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 16,
            ),
            Center(child: SelectableText(_extractText)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          var file = await FilePicker.getFilePath(type: FileType.image);
          _scanning = true;
          setState(() {});

          var watch = Stopwatch()..start();
          var _extractTextOcr = await TesseractOcr.extractText(file);
          _extractText = await PosTagger.tagText(_extractTextOcr);
          _scanTime = watch.elapsedMilliseconds;

          _scanning = false;
          setState(() {});
        },
      ),
    );
  }
}