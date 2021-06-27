import 'data_pos.dart';
import "dart:math";

class PosTagger {
  static Future<String> tagText(String input) async {
    String result = "";
    String clear1 = input.replaceAll(".", " .");

    var words = clear1.split(" ");
    for (var word_token in words) {
      var word = word_token.toLowerCase();
      var max_prob_of_tag = 0;
      var predicted_tags_with_max_probability = [];
      predicted_tags_with_max_probability.add("NNP");
      tag_dict.forEach((key, value) {
        var prior_of_tag = tag_dict[key] / total_no_of_tags;
        var word_tag = word + "_" + key;

        if (word_tag_dict.containsKey(word_tag)) {
          var likelihood_of_word_given_tag =
              word_tag_dict[word_tag] / tag_dict[key];
          var prob_tag_given_word = prior_of_tag * likelihood_of_word_given_tag;

          if (prob_tag_given_word > max_prob_of_tag) {
            predicted_tags_with_max_probability = [];
            predicted_tags_with_max_probability.add(key);
          } else if (prob_tag_given_word == max_prob_of_tag) {
            predicted_tags_with_max_probability.add(key);
          }
        }
      });
      result += word_token + "_" + getRandomElement(predicted_tags_with_max_probability).toString().toUpperCase() + " ";
    }
    return result;
  }

  static T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}