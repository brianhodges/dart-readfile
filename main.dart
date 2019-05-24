import "dart:io";
import "dart:convert";
import "team.dart";

void main() {

  var delim = "+";
  String filename = "top3list.csv";
  List<Team> teams = [];
  
  final file = new File(filename);
  Stream<List<int>> inputStream = file.openRead();
  
  print("Filename: " + filename + "\n");

  inputStream
    .transform(utf8.decoder)
    .transform(new LineSplitter())
    .listen((String line) {      
            var t1 = line.split(',')[0].trim();
            var t2 = line.split(',')[1].trim();
            Team t = new Team(t1, t2);
            teams.add(t);
      },
      onDone: () {
        for (Team team in teams) {
          	var s = ("| Team: " + team.name + " |").length - 2;
            print(delim + ("-" * s) + delim);
            print("| Team: " + team.name + " |");
            var s2 = ("| Super Bowl Wins: " + team.super_bowl_wins).length;
            print("| Super Bowl Wins: " + team.super_bowl_wins + (" " * (s - s2)) + " |");
            print(delim + ("-" * s) + delim);
        }
      },
      onError: (e) { print(e.toString()); });
}