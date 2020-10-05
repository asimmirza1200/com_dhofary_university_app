class Data {
  List<MainPageList> _mainPageList;
  List<MenuList> _menuList;
  List<BannerList> _bannerList;
  String _code;
  bool _status;
  String _message;

  Data(
      {List<MainPageList> mainPageList,
        List<MenuList> menuList,
        List<BannerList> bannerList,
        String code,
        bool status,
        String message}) {
    this._mainPageList = mainPageList;
    this._menuList = menuList;
    this._bannerList = bannerList;
    this._code = code;
    this._status = status;
    this._message = message;
  }

  List<MainPageList> get mainPageList => _mainPageList;
  set mainPageList(List<MainPageList> mainPageList) =>
      _mainPageList = mainPageList;
  List<MenuList> get menuList => _menuList;
  set menuList(List<MenuList> menuList) => _menuList = menuList;
  List<BannerList> get bannerList => _bannerList;
  set bannerList(List<BannerList> bannerList) => _bannerList = bannerList;
  String get code => _code;
  set code(String code) => _code = code;
  bool get status => _status;
  set status(bool status) => _status = status;
  String get message => _message;
  set message(String message) => _message = message;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['main_page_list'] != null) {
      _mainPageList = new List<MainPageList>();
      json['main_page_list'].forEach((v) {
        _mainPageList.add(new MainPageList.fromJson(v));
      });
    }
    if (json['menu_list'] != null) {
      _menuList = new List<MenuList>();
      json['menu_list'].forEach((v) {
        _menuList.add(new MenuList.fromJson(v));
      });
    }
    if (json['banner_list'] != null) {
      _bannerList = new List<BannerList>();
      json['banner_list'].forEach((v) {
        _bannerList.add(new BannerList.fromJson(v));
      });
    }
    _code = json['code'];
    _status = json['status'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._mainPageList != null) {
      data['main_page_list'] =
          this._mainPageList.map((v) => v.toJson()).toList();
    }
    if (this._menuList != null) {
      data['menu_list'] = this._menuList.map((v) => v.toJson()).toList();
    }
    if (this._bannerList != null) {
      data['banner_list'] = this._bannerList.map((v) => v.toJson()).toList();
    }
    data['code'] = this._code;
    data['status'] = this._status;
    data['message'] = this._message;
    return data;
  }
}

class MainPageList {
  String _iD;
  String _catTitle;
  String _active;
  String _color;
  List<ItemArray> _itemArray;

  MainPageList(
      {String iD,
        String catTitle,
        String active,
        String color,
        List<ItemArray> itemArray}) {
    this._iD = iD;
    this._catTitle = catTitle;
    this._active = active;
    this._color = color;
    this._itemArray = itemArray;
  }

  String get iD => _iD;
  set iD(String iD) => _iD = iD;
  String get catTitle => _catTitle;
  set catTitle(String catTitle) => _catTitle = catTitle;
  String get active => _active;
  set active(String active) => _active = active;
  String get color => _color;
  set color(String color) => _color = color;
  List<ItemArray> get itemArray => _itemArray;
  set itemArray(List<ItemArray> itemArray) => _itemArray = itemArray;

  MainPageList.fromJson(Map<String, dynamic> json) {
    _iD = json['ID'];
    _catTitle = json['cat_title'];
    _active = json['active'];
    _color = json['color'];
    if (json['item_array'] != null) {
      _itemArray = new List<ItemArray>();
      json['item_array'].forEach((v) {
        _itemArray.add(new ItemArray.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this._iD;
    data['cat_title'] = this._catTitle;
    data['active'] = this._active;
    data['color'] = this._color;
    if (this._itemArray != null) {
      data['item_array'] = this._itemArray.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemArray {
  String _id;
  String _title;
  String _icon;
  String _categoryId;
  String _active;

  ItemArray(
      {String id,
        String title,
        String icon,
        String categoryId,
        String active}) {
    this._id = id;
    this._title = title;
    this._icon = icon;
    this._categoryId = categoryId;
    this._active = active;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get title => _title;
  set title(String title) => _title = title;
  String get icon => _icon;
  set icon(String icon) => _icon = icon;
  String get categoryId => _categoryId;
  set categoryId(String categoryId) => _categoryId = categoryId;
  String get active => _active;
  set active(String active) => _active = active;

  ItemArray.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _icon = json['icon'];
    _categoryId = json['category_id'];
    _active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['icon'] = this._icon;
    data['category_id'] = this._categoryId;
    data['active'] = this._active;
    return data;
  }
}

class MenuList {
  String _iD;
  String _title;
  String _icon;
  String _active;

  MenuList({String iD, String title, String icon, String active}) {
    this._iD = iD;
    this._title = title;
    this._icon = icon;
    this._active = active;
  }

  String get iD => _iD;
  set iD(String iD) => _iD = iD;
  String get title => _title;
  set title(String title) => _title = title;
  String get icon => _icon;
  set icon(String icon) => _icon = icon;
  String get active => _active;
  set active(String active) => _active = active;

  MenuList.fromJson(Map<String, dynamic> json) {
    _iD = json['ID'];
    _title = json['title'];
    _icon = json['icon'];
    _active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this._iD;
    data['title'] = this._title;
    data['icon'] = this._icon;
    data['active'] = this._active;
    return data;
  }
}

class BannerList {
  String _id;
  String _image;
  String _active;

  BannerList({String id, String image, String active}) {
    this._id = id;
    this._image = image;
    this._active = active;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get image => _image;
  set image(String image) => _image = image;
  String get active => _active;
  set active(String active) => _active = active;

  BannerList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'];
    _active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['image'] = this._image;
    data['active'] = this._active;
    return data;
  }
}
