class Album {
  final String title;
  final String artist;
  final String description;
  final int numSongs;
  final String imgUrl;

  Album(
      {this.title = 'Untitled',
      this.artist = 'No Name',
      this.description = 'No description',
      this.numSongs = 0,
      this.imgUrl = ''});
}
