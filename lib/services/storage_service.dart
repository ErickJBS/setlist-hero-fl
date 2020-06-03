import 'dart:io' show Platform;
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class StorageService {

  StorageService() {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterDownloader.initialize(
      debug: false
    );
  }

  Future<File> downloadFile(String link) async {
    bool permission = await _checkPermission();
    if (!permission) {
      throw Exception('No storage permissions granted');
    }

    String fileName = _getFileNameFromLink(link);
    File file = await _openFile(fileName);
    if (await file.exists()) {
      return file;
    }

    String directory = await _getDirectory();
    final taskId = await FlutterDownloader.enqueue(
      url: link,
      savedDir: directory,
      showNotification: false
    );
    // TODO: check when file is downloaded
  }

  String _getFileNameFromLink(String link) {
    List parts = link.split('/');
    return parts.last;
  }

  Future<String> _getDirectory() async {
    final directory = await getExternalStorageDirectory();
    return directory.path;
  }

  Future<File> _openFile(String fileName) async {
    final directory = await _getDirectory();
    final path = '$directory/$fileName';
    return File(path);
  }

  Future<bool> _checkPermission() async {
    if (Platform.isAndroid) {
      PermissionStatus status = await Permission.storage.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }
}