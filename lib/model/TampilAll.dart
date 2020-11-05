class ModelBerita {
  String _judul;
  double _isi;
  double _kategori;
  String _iduser;
  String _photo;
  String _id;
  String _waktu;

  ModelBerita(this._judul, this._isi, this._kategori, this._iduser, this._photo,
      this._waktu);

  ModelBerita.map(dynamic obj) {
    this._judul = obj['judul'];
    this._isi = obj['isi'];
    this._kategori= obj['kategori'];
    this._iduser = obj['iduser'];
    this._photo = obj['photo'];
    this._waktu = obj['photo'];
    this._id = obj['id'];
  }

  String get judul => _judul;

  double get isi => _isi;

  double get kategori => _kategori;

  String get photo => _photo;

  String get iduser => _iduser;

  String get waktu => _waktu;

  String get id => _id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['judul'] = _judul;
    map['isi'] = _isi;
    map['kategori'] = _kategori;
    map['iduser'] = _iduser;
    map['photo'] = _photo;
    map['waktu'] = _waktu;
    map['id'] = _id;
    return map;
  }

  ModelBerita.fromMap(Map<String, dynamic> map) {
    this._judul = map['judul'];
    this._isi = map['isi'];
    this._kategori = map['kategori'];
    this._iduser = map['iduser'];
    this._photo = map['photo'];
    this._waktu = map['waktu'];
    this._id = map['id'];
  }


}
