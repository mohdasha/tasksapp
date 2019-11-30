
import 'package:flutter/material.dart';

class Task {
  String _title;
  List<String> _tags;
  String _status;

  static Map<String, Color> colorMap = Map();
  
  Task(_title, _tags, _status) {
    this._title = _title;
    this._tags = _tags;
    this._status = _status;

  }

  String getTitle() {
    return this._title;
  }

  String getTags() {
    return _tags.join(' ');
  }

  String getStatus() {
    return this._status;
  }
}