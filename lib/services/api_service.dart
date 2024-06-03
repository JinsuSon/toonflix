import 'dart:convert';

import 'package:http/http.dart' as http; // API 연동시 많이 쓸듯
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    // http 통신으로 api 정보를 얻을 때 비동기 프로그래밍 하는 것 잊지 말기
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url); // 1. 리스폰스를 받기
    if (response.statusCode == 200) {
      // api통신이 정상인 조건
      final List<dynamic> webtoons =
          jsonDecode(response.body); // 2. 응답받은 스트링형태의 리스폰스를 제이슨으로 디코딩
      for (var webtoon in webtoons) {
        webtoonInstances
            .add(WebtoonModel.fromJson(webtoon)); // 3. 제이슨포맷데이터를 Dart에 맞게 변형
      }

      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);

      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
