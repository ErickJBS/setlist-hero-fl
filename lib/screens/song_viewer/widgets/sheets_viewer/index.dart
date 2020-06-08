import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:setlistherofl/models/song.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/feedback_message/index.dart';
import 'package:setlistherofl/screens/song_viewer/widgets/sheets_viewer/style.dart';
import 'package:setlistherofl/service_locator.dart';
import 'package:setlistherofl/services/storage_service.dart';

enum Status { isLoading, noContent, loaded, partial }

class _DropdownValueInfo {
  int index;
  String url;
  String content;
  Status status;

  _DropdownValueInfo({this.index, this.content, this.status, this.url});

  @override
  String toString() {
    return content;
  }
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
  List<PdfView> _pdfViews = [];
  List<Status> status = [];
  List<_DropdownValueInfo> _dropdownValues = [];
  List<List<Sheet>> _setSheets = [];

  @override
  void initState() {
    super.initState();
    _initSetSheets();
    _initDropdownValues();
    _initPdfViews();
    _loadPdf();
  }

  @override
  void dispose() {
    _disposePdfControllers();
    super.dispose();
  }

  void _loadPdf() {
    var info = _dropdownValues[widget.index];

    if (info.url.isEmpty || info == null || info.url == null) {
      info.status = Status.partial;
    }
    
    if (info.status == Status.isLoading) {
      _storageService.downloadFile(info.url).then((value) {
        var controller =
            PdfController(document: PdfDocument.openFile(value.path));

        setState(() {
          info.status = Status.loaded;
          _pdfViews[widget.index] = PdfView(
            controller: controller,
            scrollDirection: Axis.vertical,
            documentLoader: Center(child: CircularProgressIndicator()),
            pageLoader: Center(child: CircularProgressIndicator()),
          );
        });
      });
    }
    
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

  void _initPdfViews() {
    int size = widget.songs.length;

    for (int i = 0; i < size; i++) {
      _pdfViews.add(null);
    }
  }

  List<String> _getListOfInstruments(int index) {
    List<String> listOfInstruments = [];

    

    _setSheets[index].forEach((element) {
      listOfInstruments.add(element.instrument);
      });

    return listOfInstruments;
  }

  void _disposePdfControllers() {
    _pdfViews.forEach((element) {
      if (element != null) {
        element.controller.dispose();
      }
     });
  }

  void _updateDropdownValue(int index, String value) {
    int _index = 0;
    _setSheets[index].forEach((element) {
      if (element.instrument == value) {
        _dropdownValues[index] = _DropdownValueInfo(
          content: element.instrument,
          index: _index,
          status: Status.isLoading,
          url: element.content
        );
      }
      _index++;
      });
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(
      List<String> listOfInstruments) {
    return listOfInstruments.map<DropdownMenuItem<String>>((e) {
      return DropdownMenuItem<String>(
          value: e, child: Text(e, style: Theme.of(context).textTheme.subtitle2,));
    }).toList();
  }

  Widget _buildDropdown(int index) {
    bool isEnable = _dropdownValues[index].status != Status.noContent;
    var instruments = _getListOfInstruments(index);

    print(_dropdownValues[index]);

    return DropdownButton<String>(
      value: isEnable ? _dropdownValues[index].content : null,
      icon: Icon(Icons.arrow_drop_down),
      dropdownColor: Theme.of(context).backgroundColor,
      iconSize: 24,
      elevation: 16,      
      hint: isEnable ? null : Text('No instruments available', style: Theme.of(context).textTheme.subtitle2),
      style: dropdownTextStyle,
      underline: Container(
        height: 0,
      ),
      onChanged: isEnable
          ? (newValue) {
            print(newValue);
              setState(() {
                _updateDropdownValue(index, newValue);
              });
              _loadPdf();
            }
          : null,
      items: isEnable ? _buildDropdownItems(instruments) : null,
    );
  }

  Widget _buildDropdownCard(int index) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Card(
            color: Theme.of(context).backgroundColor,
            shadowColor: Theme.of(context).cardTheme.shadowColor,
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
            color: Theme.of(context).backgroundColor,
            shadowColor: Theme.of(context).cardTheme.shadowColor,
            child: Padding(padding: const EdgeInsets.all(8.0), child: body),
          )),
    ));
  }

  Widget _buildCard(List<Widget> widgets) {
    return Column(
      children: widgets,
    );
  }

  List<Widget> _buildCards() {
    List<Widget> cards = [];
    var loading = Container(child: Center(child: CircularProgressIndicator()));
    int size = widget.songs.length;

    for (int i = 0; i < size; i++) {
      cards.add(_buildCard([
        _buildDropdownCard(i),
        _dropdownValues[i].status == Status.noContent || _dropdownValues[i].status == Status.partial
            ? Expanded(
                child: FeedbackMessage(
                    icon: MdiIcons.textBoxRemove,
                    message: 'No content for this song'),
              )
            : _buildSheetCard(_dropdownValues[i].status == Status.isLoading
                ? loading
                : _pdfViews[i])
      ]));
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    print(_setSheets);

    return PageView(
      onPageChanged: (value) {
        _loadPdf();
      },
      physics: NeverScrollableScrollPhysics(),
      controller: widget.pageController,
      children: _buildCards(),
    );
  }
}
