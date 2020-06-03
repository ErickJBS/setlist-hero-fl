import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class SheetsViewer extends StatefulWidget {
  PageController pageController;

  SheetsViewer({@required this.pageController});


  @override
  State<StatefulWidget> createState() {
    return _SheetsViewerState();
  }
}

class _SheetsViewerState extends State<SheetsViewer> {
  final String _montserratFontFamily = 'Montserrat';
  int _actualPageNumber = 1, _allPagesCount = 0;
  PdfController _pdfController;
  PageController controller =
      PageController(initialPage: 1, viewportFraction: 0.9);

  @override
  void initState() {
    _pdfController = PdfController(
      document: PdfDocument.openAsset('assets/images/example.pdf'),
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  Widget _generateCardContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
      child: Card(
        child: PdfView(
          documentLoader: Center(child: CircularProgressIndicator()),
          pageLoader: Center(child: CircularProgressIndicator()),
          controller: _pdfController,
          scrollDirection: Axis.vertical,
          onDocumentLoaded: (document) {
            setState(() {
              //_allPagesCount = document.pagesCount;
            });
          },
          onPageChanged: (page) {
            setState(() {
              _actualPageNumber = page;
            });
          },
        )
      )
    );
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

    return PageView(controller: controller,
        children: <Widget>[Text('asd'), Text('asdasd'),]);
  }
}
