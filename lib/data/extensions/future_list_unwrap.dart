extension FutureListUnwrap<T> on List<Future<T>> {
  Future<List<T>> toListSync() async {
    return Future.wait(this);
  }
}
