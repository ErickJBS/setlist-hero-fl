import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:setlistherofl/models/song.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/feedback_message/index.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/sheets_viewer/style.dart';
import 'package:setlistherofl/service_locator.dart';
import 'package:setlistherofl/services/storage_service.dart';

enum Status { isLoading, noContent, loaded }

class _DropdownValueInfo {
  int index;
  String url;
  String content;
  Status status;

  _DropdownValueInfo({this.index, this.content, this.status, this.url});
}

class SheetsViewer extends StatefulWidget {
  final PageController pageController;
  final List<Song> songs;
  final int index;

  SheetsViewer({this.pageController, this.index, this.songs});

  @override
  State<StatefulWidget> createState() {
    return _SheetsViewerState();
  }
}

class _SheetsViewerState extends State<SheetsViewer> {
  static StorageService _storageService = locator<StorageService>();
  List<PdfView> pdfViews = [];
  List<Status> status = [];
  List<_DropdownValueInfo> _dropdownValues = [];
  List<List<Sheet>> _setSheets = [];

  @override
  void initState() {
    super.initState();
    _initSetSheets();
    _initDropdownValues();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadPdf() {
    int currentDisplayIndex = 0;

    _storageService
        .downloadFile(
            'https://storage.googleapis.com/setlist-hero.appspot.com/1591236132603_led_zeppelin-stairway_to_heaven.pdf')
        .then((value) {
      var controller =
          PdfController(document: PdfDocument.openFile(value.path));

      setState(() {
        status[currentDisplayIndex] = Status.loaded;
        pdfViews[currentDisplayIndex] = PdfView(
          controller: controller,
          documentLoader: CircularProgressIndicator(),
          pageLoader: CircularProgressIndicator(),
        );
      });
    });
  }

  void _initSetSheets() {
    widget.songs.forEach((element) {
      _setSheets.add(element.sheets);
    });
  }

  void _initDropdownValues() {
    _setSheets.forEach((element) {
      if (element != null && element.isNotEmpty) {
        _dropdownValues.add(_DropdownValueInfo(
            content: element[0].instrument,
            url: element[0].content,
            index: 0,
            status: Status.isLoading));
      } else {
        _dropdownValues.add(_DropdownValueInfo(
            content: 'No instruments available',
            index: 0,
            status: Status.noContent));
      }
    });
  }

  List<String> _getListOfInstruments(int index) {
    List<String> listOfInstruments = [];
    _setSheets[index].forEach((element) {
      listOfInstruments.add(element.instrument);
    });

    return listOfInstruments;
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(
      List<String> listOfInstruments) {
    return listOfInstruments.map<DropdownMenuItem<String>>((e) {
      return DropdownMenuItem<String>(value: e, child: Text(e));
    }).toList();
  }

  Widget _buildDropdown(int index) {
    bool isEnable = _dropdownValues[index].status != Status.noContent;
    var instruments = _getListOfInstruments(index);
    var items;

    if (instruments.isNotEmpty) {
      items = _buildDropdownItems(instruments);
    } else {
      items = _buildDropdownItems([_dropdownValues[index].content]);
    }

    return DropdownButton<String>(
      value: _dropdownValues[index].content,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      hint: Text('No instruments available'),
      style: dropdownTextStyle,
      underline: Container(
        height: 0,
      ),
      onChanged: isEnable
          ? (String newValue) {
              setState(() {
                _dropdownValues[index].content = newValue;
              });
            }
          : null,
      items: items,
    );
  }

  Widget _buildDropdownCard(int index) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildDropdown(index)),
          ),
        ));
  }

  Widget _buildSheetCard(Widget body) {
    return Expanded(
        child: Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
          child: Card(
            child: Padding(padding: const EdgeInsets.all(8.0), child: body),
          )),
    ));
  }

  Widget _buildCard(List<Widget> widgets) {
    return Column(children: widgets,);
  }

  List<Widget> _buildCards() {
    List<Widget> cards = [];

    cards.add(_buildCard([_buildDropdownCard(0), _buildSheetCard(Text('asd'))]));
    cards.add(_buildCard([_buildDropdownCard(1), _buildSheetCard(Text('asd'))]));
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    print(_setSheets);

    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: widget.pageController,
      children: _buildCards(),
    );
  }
}
