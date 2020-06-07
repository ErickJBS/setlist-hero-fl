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

  List<_DropdownValueInfo> _getListOfInstruments(int index) {
    List<_DropdownValueInfo> listOfInstruments = [];
    int index = 0;

    _setSheets[index].forEach((element) {
      listOfInstruments.add(_DropdownValueInfo(
          content: element.instrument,
          index: index,
          status: Status.isLoading,
          url: element.content));
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

  List<DropdownMenuItem<_DropdownValueInfo>> _buildDropdownItems(
      List<_DropdownValueInfo> listOfInstruments) {
    return listOfInstruments.map<DropdownMenuItem<_DropdownValueInfo>>((e) {
      return DropdownMenuItem<_DropdownValueInfo>(
          value: e, child: Text(e.content, style: Theme.of(context).textTheme.subtitle2,));
    }).toList();
  }

  Widget _buildDropdown(int index) {
    bool isEnable = _dropdownValues[index].status != Status.noContent;
    var instruments = _getListOfInstruments(index);
    var items;

    if (instruments.isNotEmpty) {
      items = _buildDropdownItems(instruments);
    } else {
      items = _buildDropdownItems([_dropdownValues[index]]);
    }

    return DropdownButton<_DropdownValueInfo>(
      value: _dropdownValues[index],
      icon: Icon(Icons.arrow_drop_down),
      dropdownColor: Theme.of(context).backgroundColor,
      iconSize: 24,
      elevation: 16,      
      hint: Text('No instruments available', style: Theme.of(context).textTheme.subtitle2),
      style: dropdownTextStyle,
      underline: Container(
        height: 0,
      ),
      onChanged: isEnable
          ? (_DropdownValueInfo newValue) {
              setState(() {
                _dropdownValues[index] = newValue;
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
        _dropdownValues[i].status == Status.noContent
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
