
import 'dart:convert';


class PlayersModel
{
  final String?  name ;
  final int?   color;
   int     point ;

  PlayersModel({required this.point, required this.name, required this.color});

  factory PlayersModel.fromJson(jsonData)
  {
    return PlayersModel(
      point: jsonData["point"],
       name: jsonData["name"], 
       color: jsonData["color"],
       );
  }
    static Map<String, dynamic> toMap(PlayersModel player) => {
        'name': player.name,
        'color': player.color,
        'point': player.point,
        
      };

  static String encode(List<PlayersModel> players) => json.encode(
        players.map<Map<String, dynamic>>((player) => PlayersModel.toMap(player))
            .toList(),
      );

  static List<PlayersModel> decode(String player) =>
      (json.decode(player) as List<dynamic>).map<PlayersModel>((item) =>
       PlayersModel.fromJson(item)).toList();
}
  
