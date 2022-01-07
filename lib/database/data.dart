class IntroItem {
  IntroItem({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final sampleItems = <IntroItem>[
  IntroItem(
    title: 'Banned words:\nread\nstudy\nwriter',
    category: 'Book',
    imageUrl: 'images/read.png',
  ),
  IntroItem(
    title: 'Banned words:\ncomputer\ndeveloper\nmouse',
    category: 'Notebook',
    imageUrl: 'images/notebook.png',
  ),
  IntroItem(
    title: 'Banned words:\nanimal\nfly\nornithology',
    category: 'Bird',
    imageUrl: 'images/bird.png',
  ),
  IntroItem(
    title: 'Banned words:\nsunny\nrainy\nsky',
    category: 'Weather',
    imageUrl: 'images/weather.png',
  ),
];
