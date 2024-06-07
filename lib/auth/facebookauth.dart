import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// \https://flourapp-a9bf1.firebaseapp.com/__/auth/handler

Future<UserCredential?> signInWithFacebook() async {
  try {
    // تفعيل عملية تسجيل الدخول عبر فيسبوك
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // التحقق من حالة نتيجة تسجيل الدخول
    switch (loginResult.status) {
      case LoginStatus.success:
        // تسجيل الدخول ناجح
        // استلام رمز الوصول
        final AccessToken accessToken = loginResult.accessToken!;

      // استخدام رمز الوصول لإنشاء بيانات اعتماد فيسبوك
      // final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);

      // تسجيل الدخول إلى Firebase باستخدام بيانات اعتماد فيسبوك وإرجاع بيانات المستخدم
      // return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      case LoginStatus.cancelled:
        // المستخدم ألغى عملية تسجيل الدخول
        print("تم إلغاء تسجيل الدخول عبر فيسبوك");
        return null;

      case LoginStatus.failed:
        // فشل في تسجيل الدخول
        print("فشل تسجيل الدخول عبر فيسبوك: ${loginResult.message}");
        return null;

      default:
        // حالة غير معروفة
        print(
            "حالة غير معروفة لتسجيل الدخول عبر فيسبوك: ${loginResult.status}");
        return null;
    }
  } catch (e) {
    // التعامل مع أي أخطاء حدثت أثناء عملية تسجيل الدخول
    print("خطأ أثناء تسجيل الدخول عبر فيسبوك: $e");
    return null;
  }
}
