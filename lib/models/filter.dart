import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filter {
  double startValue = 0;
  double endValue = 1;

  Filter.createInstance(this.startValue, this.endValue);
  Filter();
}

class Filters with ChangeNotifier, DiagnosticableTreeMixin {
  List<Filter> _filters = new List<Filter>();

  Add(Filter f) {
    if (!_filters.contains(f)) {
      _filters.add(f);
      notifyListeners();
    }
  }

  CopyItem(List<Filter> fItem) {
    _filters = new List<Filter>();
    _filters = fItem;
  }

  AddItem(double s, double e) {
    Filter f = new Filter();
    f.startValue = s;
    f.endValue = e;
    Add(f);
  }

  List<Filter> get items {
    return _filters;
  }

  void set items(List<Filter> fitem) {
    _filters = fitem;
  }

  int get count {
    return _filters.length;
  }

  bool _isAllSelect = true;
  bool chcbox1 = true;
  bool chcbox3 = true;
  bool chcbox4 = true;
  bool chcbox5 = true;
  bool chcbox6 = true;
  bool chcbox7 = true;
  bool chcbox8 = true;

  _setChcBoxStatus(
    bool chcbox1,
    bool chcbox3,
    bool chcbox4,
    bool chcbox5,
    bool chcbox6,
    bool chcbox7,
    bool chcbox8,
  ) {
    this.chcbox1 = chcbox1;
    this.chcbox3 = chcbox3;
    this.chcbox4 = chcbox4;
    this.chcbox5 = chcbox5;
    this.chcbox6 = chcbox6;
    this.chcbox7 = chcbox7;
    this.chcbox8 = chcbox8;
  }

  Update(Filters f) {
    _setChcBoxStatus(f.chcbox1, f.chcbox3, f.chcbox4, f.chcbox5, f.chcbox6,
        f.chcbox7, f.chcbox8);
    CopyItem(f.items);
    notifyListeners();
  }

  Refresh()
  {
    notifyListeners();
  }

// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
