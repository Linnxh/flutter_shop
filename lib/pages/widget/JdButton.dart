import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/services/ScreenAdaper.dart';


class JdButton extends StatelessWidget {

  final Color color;
  final String text; 
  final Function()? cb;  //注意：新版Flutter中需要把cb定义成Function()类型或者var类型
  JdButton({Key? key,this.color=Colors.black,this.text="按钮",this.cb=null}) : super(key: key);

  @override
  Widget build(BuildContext context) {   
    return InkWell(
      onTap: this.cb,
      child: Container(
        margin: EdgeInsets.all(ScreenAdaper.height(10)),
        padding: EdgeInsets.all(ScreenAdaper.height(10)),
        height: ScreenAdaper.height(68),
        width: double.infinity,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            "${text}",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
