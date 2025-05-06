// مثال توضيحي لدوال دورة الحياة لويدجت ذو حالة
import 'package:flutter/cupertino.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    // يستخدم لتهيئة الحالة (مثلاً بدء اشتراك في بيانات)
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // يُستدعى بعد initState أو عند تغيير التبعيات (InheritedWidget)
  }

  @override
  Widget build(BuildContext context) {
    // بناء واجهة المستخدم حسب الحالة الحالية
    return Container();
  }

  @override
  void didUpdateWidget(covariant MyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // معالجة التغيرات عند تحديث خصائص الودجت من الوالد
  }

  @override
  void deactivate() {
    super.deactivate();
    // تنظيف قبل إزالة الودجت مؤقتًا من الشجرة
  }

  @override
  void dispose() {
    // تحرير الموارد النهائية (مثلاً إلغاء الاشتراكات)
    super.dispose();
  }
}
