class ApiResponse<T>{
  bool ok;
  String msg;
  T resul;

  ApiResponse.ok(this.resul) {
    ok = true;
  }
  ApiResponse.notOk(this.msg) {
    ok = false;
  }
}