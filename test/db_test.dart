import 'package:flutter_test/flutter_test.dart';
import 'package:topkapi_bank/line/db/firestore/fb_db_manager.dart';
import 'package:topkapi_bank/models/auth/bank_user.dart';

void main() {
  group('FirebaseDbManager Tests', () {
    late FirebaseDbManager dbManager;

    setUp(() {
      dbManager = FirebaseDbManager();
    });

    test('Read User Test', () async {
      // Test için bir örnek kullanıcı kimliği oluştur
      String userId = 'exampleUserId';

      // Kullanıcıyı veritabanından okur
      BankUser? user = await dbManager.readUser(userId);

      // Kullanıcının null olmadığını doğrular
      expect(user, isNotNull);

      // Kullanıcının userId'sinin beklenen değere eşit olduğunu doğrular
      expect(user?.userId, userId);
    });

    test('Save User Test', () async {
      // Test için bir örnek kullanıcı oluştur
      BankUser user = const BankUser(
        userId: 'exampleUserId',
        // Diğer gerekli alanları doldur
      );

      // Kullanıcıyı veritabanına kaydet
      bool result = await dbManager.saveUser(user);

      // Kaydetme işleminin başarılı olduğunu doğrula
      expect(result, isTrue);
    });

    // Diğer test senaryolarını buraya ekleyebilirsiniz
  });
}
