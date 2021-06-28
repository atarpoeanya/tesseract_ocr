import 'data_pos.dart';
import "dart:math";

class PosTagger {
  static Future<String> tagText(String input) async {
    String result = "";
    String clear = input.replaceAll(".", " .").replaceAll('\n', ' ').replaceAll(',', ' ,').replaceAll('?', ' ?').replaceAll('!', ' !').replaceAll('(', '( ').replaceAll(')', ' )').replaceAll('-', ' - ');

    var words = clear.split(" ");
    for (var word_token in words) {
      var word = word_token.toLowerCase();
      var maxProbOfTag = 0;
      var predictedTagsWithMaxProbability = [];
      predictedTagsWithMaxProbability.add("NNP");
      tag_dict.forEach((key, value) {
        var priorOfTag = tag_dict[key] / total_no_of_tags;
        var wordTag = word + "_" + key;

        if (word_tag_dict.containsKey(wordTag)) {
          var likelihoodOfWordGivenTag =
              word_tag_dict[wordTag] / tag_dict[key];
          var probTagGivenWord = priorOfTag * likelihoodOfWordGivenTag;

          if (probTagGivenWord > maxProbOfTag) {
            predictedTagsWithMaxProbability = [];
            predictedTagsWithMaxProbability.add(key);
          } else if (probTagGivenWord == maxProbOfTag) {
            predictedTagsWithMaxProbability.add(key);
          }
        }
      });
      result += word_token + "_" + getRandomElement(predictedTagsWithMaxProbability).toString().toUpperCase() + " ";
    }
    return result;
  }

  static T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}