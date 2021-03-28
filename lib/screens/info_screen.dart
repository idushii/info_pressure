import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('О приложении')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Text('\nДанное приложение не передает  никакой информации на внешние сервера. \n\nДанное приложение не использует Ваши персональные данные никоим образом, кроме отображения их в данном приложении. \n\nДля использвания данных где-либо, кроме данного  приложения будет реализована возможность экспортирования данных в текстовый файл. На данный  момент такая возможность  не предусмотрена. \n\nДанное приложение не использует авторизацию.\n\nДанное приложение не исползует шифрование или любые другие системы для обеспечения безопасности данных.\n\nДля связи с автором возмоножно использовать email infopressure@yandex.ru.\n\nИконка приложения взята с сайта icons8.ru'),
            ],
          ),
        ),
      ),
    );
  }

}