import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:codroid_hub/appwrite.dart';
import 'package:codroid_hub/data/env.dart';
import 'package:codroid_hub/modules/members/model/members_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final membersListProvider = FutureProvider<List<MembersModel>>((ref) async {
  try {
    final database = ApiClient.database;
    final DocumentList result = await database.listDocuments(
      collectionId: Env.membersCollectionId,
      databaseId: Env.dataBaseId,
    );

    Logger().i(result.documents.first.data);
    final membersList = result.documents
        .map((member) => MembersModel.fromMap(member.data))
        .toList();

    return membersList;
  } on AppwriteException catch (error) {
    Logger().e(error.message);
    return [];
  }
});
