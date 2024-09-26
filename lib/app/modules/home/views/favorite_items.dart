class FavoriteItem {
  final String name;
  final String description;

  FavoriteItem(this.name, this.description);

  @override
  String toString() {
    return 'FavoriteItem{name: $name, description: $description}';
  }
}
