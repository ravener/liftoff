import 'dart:convert';

import 'package:flutter/foundation.dart' show required;
import 'package:http/http.dart' as http;

import '../models/post.dart';
import 'main.dart';

extension PostEndpoint on V1 {
  /// POST /post
  /// https://dev.lemmy.ml/docs/contributing_websocket_http_api.html#post
  Future<PostView> createPost({
    @required String name,
    String url,
    String body,
    @required bool nsfw,
    @required int communityId,
    @required String auth,
  }) {
    throw UnimplementedError();
  }

  /// GET /post
  /// https://dev.lemmy.ml/docs/contributing_websocket_http_api.html#get-post
  Future<FullPost> getPost({
    @required int id,
    String auth,
  }) {
    throw UnimplementedError();
  }

  /// GET /post/list
  /// https://dev.lemmy.ml/docs/contributing_websocket_http_api.html#get-posts
  Future<List<PostView>> getPosts({
    @required PostListingType type,
    @required SortType sort,
    int page,
    int limit,
    int communityId,
    String communityName,
  }) async {
    assert(type != null);
    assert(sort != null);

    var res = await http.get(Uri.https(
      instanceUrl,
      "/api/v1/post/list",
      {
        'type_': type.value,
        'sort': sort.value,
        if (page != null) 'page': page.toString(),
        if (limit != null) 'limit': limit.toString(),
        if (communityId != null) 'community_id': communityId.toString(),
        if (communityName != null) 'community_name': communityName,
      },
    ));
    List<dynamic> json = jsonDecode(res.body)["posts"];
    return json.map((e) => PostView.fromJson(e)).toList();
  }

  /// POST /post/like
  /// https://dev.lemmy.ml/docs/contributing_websocket_http_api.html#create-post-like
  Future<PostView> createPostLike({
    @required int postId,
    @required Vote score,
    @required String auth,
  }) {
    throw UnimplementedError();
  }

  /// PUT /post
  /// https://dev.lemmy.ml/docs/contributing_websocket_http_api.html#edit-post
  Future<PostView> editPost({
    @required int editId,
    @required String name,
    String url,
    String body,
    @required bool nsfw,
    @required String auth,
  }) {
    throw UnimplementedError();
  }

  /// POST /post/delete
  /// https://dev.lemmy.ml/docs/contributing_websocket_http_api.html#delete-post
  /// delete a post in a user deleting their own kind of way
  Future<PostView> deletePost({
    @required int editId,
    @required bool deleted,
    @required String auth,
  }) {
    throw UnimplementedError();
  }

  /// POST /post/remove
  /// https://dev.lemmy.ml/docs/contributing_websocket_http_api.html#remove-post
  /// remove post in an admin kind of way
  Future<PostView> removePost({
    @required int editId,
    @required bool removed,
    String reason,
    @required String auth,
  }) {
    throw UnimplementedError();
  }

  /// POST /post/save
  /// https://dev.lemmy.ml/docs/contributing_websocket_http_api.html#save-post
  Future<PostView> savePost({
    @required int postId,
    @required bool save,
    @required String auth,
  }) {
    throw UnimplementedError();
  }
}
