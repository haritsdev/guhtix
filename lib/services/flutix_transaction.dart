part of 'services.dart';

class FlutixTransactionServices {
  static CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection('transactions');

  static Future<void> saveTransaction(
      FlutixTransaction flutixTransaction) async {
    await transactionCollection.doc().set({
      'userID': flutixTransaction.userID,
      'title': flutixTransaction.title,
      'subtitle': flutixTransaction.subtitle,
      'time': flutixTransaction.time.microsecondsSinceEpoch,
      'picture': flutixTransaction.picture,
    });
  }

  static Future<List<FlutixTransaction>> getTransaction(String userID) async {
    QuerySnapshot snapshot = await transactionCollection.get();

    var documents =
        snapshot.docs.where((document) => document.get('userID') == userID);

    return documents
        .map((e) => FlutixTransaction(
            userID: e.get('userID'),
            title: e.get('title'),
            subtitle: e.get('subtitle'),
            time: DateTime.fromMicrosecondsSinceEpoch(e.get('time')),
            amount: e.get('amount'),
            picture: e.get('picture')))
        .toList();
  }
}
