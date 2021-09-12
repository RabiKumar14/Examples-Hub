class Recommendation {
  final String? name, source, text;

  Recommendation(this.name, this.source, this.text);
}

List<Recommendation> recommendationsList = [
  Recommendation('Varun', 'UON',
      'He is hardworking and able to complete tasks by deadlines.'),
  Recommendation('Shwe', 'UON',
      'She is the best leader anyone can hope for. aaaaaaaaaaaaaaaa'),
  Recommendation('Shwe', 'UON',
      'She is the best leader anyone can hope for. bbbbbbbbbbbbbbbbbb')
];

class Project {
  final String? title, des;

  Project(this.title, this.des);
}

List<Project> projects = [
  Project('Test 1', 'Testing of the widgets 11111111'),
  Project('Test 2', 'Testing of the widgets 22222222'),
  Project('Test 3', 'Testing of the widgets 333333333'),
  Project('Test 4', 'Testing of the widgets 44444444444'),
  Project('Test 5', 'Testing of the widgets 5555555555'),
  Project('Test 6', 'Testing of the widgets 666666666'),
];
