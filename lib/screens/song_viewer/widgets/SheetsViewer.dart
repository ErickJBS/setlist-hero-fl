import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class SheetsViewer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SheetsViewerState();
  }
}

class _SheetsViewerState extends State<SheetsViewer> {
  final String _montserratFontFamily = 'Montserrat';
  int _actualPageNumber = 1, _allPagesCount = 0;
  PdfController _pdfController;

  @override
  void initState() {
    _pdfController = PdfController(
      document: PdfDocument.openAsset('assets/sample.pdf'),
    );
    super.initState();
  }

  @override
  void dispose() {
     _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*var right = SheetMusic(
      height: (MediaQuery.of(context).size.width * 0.9 / 1.97),
      width: MediaQuery.of(context).size.width,
      trebleClef: true,
      scale: "Gb Major",
      pitch: 'A4',
      pitchTap: () {
        print('ppop');
      },
      clefTap: () {
        print('asd');
      },
    );

    var left = SheetMusic(
      height: (MediaQuery.of(context).size.width * 0.9 / 1.97),
      width: MediaQuery.of(context).size.width,
      trebleClef: false,
      scale: "C Major",
      pitch: 'A5',
      pitchTap: () {
        print('ppop');
      },
      clefTap: () {
        print('asd');
      },
    );*/

    return PdfView(
            documentLoader: Center(child: CircularProgressIndicator()),
            pageLoader: Center(child: CircularProgressIndicator()),
            controller: _pdfController,
            onDocumentLoaded: (document) {
              setState(() {
                _allPagesCount = document.pagesCount;
              });
            },
            onPageChanged: (page) {
              setState(() {
                _actualPageNumber = page;
              });
            },
          );
  }

}