import 'package:flutter/material.dart';
import 'package:nusantech_test_flutter/checkbox.dart';
import 'package:toast/toast.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  CheckkingBox checkkingBox=CheckkingBox();

  bool cek1=false;
  bool cek2=false;
  bool cek3=false;
  int indexcheck=0;
  List<CheckkingBox> listcheckbox=[
    CheckkingBox(ischeck: false,checkid: 1),
    CheckkingBox(ischeck: false,checkid: 2),
    CheckkingBox(ischeck: false,checkid: 3),
  ];

  var  result;

  int kali(){
    setState(() {
      if(cek1&cek2!=true && cek2&cek3!=true&& cek3&cek1!=true){
        shwotoast('Error!!! Ceklis minimal 2 ',duration: 2,gravity: Toast.CENTER,);
      }else if(cek1&cek2&cek3 && cek2&cek3&cek1 && cek3&cek1&cek2 && cek2&cek1&cek3 && cek3&cek2&cek1!=false){
        result =int.parse(field1.text)*int.parse(field2.text)*int.parse(field3.text);
      }else if(cek1&cek2!=false){
        result =int.parse(field1.text)*int.parse(field2.text);
      }else if(cek2&cek3!=false){
        result =int.parse(field2.text)*int.parse(field3.text);
      }else if(cek1&cek3!=false){
        result =int.parse(field1.text)*int.parse(field3.text);
      }
    });
  }

  double bagi(){
    setState(() {
      if(cek1&cek2!=true && cek2&cek3!=true&& cek3&cek1!=true){
        shwotoast('Error!!! Ceklis minimal 2 ',duration: 2,gravity: Toast.CENTER,);
      }else if(cek1&cek2&cek3 && cek2&cek3&cek1 && cek3&cek1&cek2 && cek2&cek1&cek3 && cek3&cek2&cek1!=false){
        result =int.parse(field1.text)/int.parse(field2.text)/int.parse(field3.text);
      }else if(cek1&cek2!=false){
        result =int.parse(field1.text)/int.parse(field2.text);
      }else if(cek2&cek3!=false){
        result =int.parse(field2.text)/int.parse(field3.text);
      }else if(cek1&cek3!=false){
        result =int.parse(field1.text)/int.parse(field3.text);
      }
    });
  }

  int tambah(){
    setState(() {
      if(cek1&cek2!=true && cek2&cek3!=true&& cek3&cek1!=true){
        shwotoast('Error!!! Ceklis minimal 2 ',duration: 2,gravity: Toast.CENTER,);
      }else if(cek1&cek2&cek3 && cek2&cek3&cek1 && cek3&cek1&cek2 && cek2&cek1&cek3 && cek3&cek2&cek1!=false){
        result =int.parse(field1.text)+int.parse(field2.text)+int.parse(field3.text);
      }else if(cek1&cek2!=false){
        result =int.parse(field1.text)+int.parse(field2.text);
      }else if(cek2&cek3!=false){
        result =int.parse(field2.text)+int.parse(field3.text);
      }else if(cek1&cek3!=false){
        result =int.parse(field1.text)+int.parse(field3.text);
      }
    });
  }

  int kurang(){
   setState(() {
     if(cek1&cek2!=true && cek2&cek3!=true&& cek3&cek1!=true){
       shwotoast('Error!!! Ceklis minimal 2 ',duration: 2,gravity: Toast.CENTER,);
     }else if(cek1&cek2&cek3 && cek2&cek3&cek1 && cek3&cek1&cek2 && cek2&cek1&cek3 && cek3&cek2&cek1!=false){
       result =int.parse(field1.text)-int.parse(field2.text)-int.parse(field3.text);
     }else if(cek1&cek2!=false){
       result =int.parse(field1.text)-int.parse(field2.text);
     }else if(cek2&cek3!=false){
       result =int.parse(field2.text)-int.parse(field3.text);
     }else if(cek1&cek3!=false){
       result =int.parse(field1.text)-int.parse(field3.text);
     }
   });
  }



  TextEditingController field1=TextEditingController();
  TextEditingController field2=TextEditingController();
  TextEditingController field3=TextEditingController();
  TextEditingController error=TextEditingController();

  void clearfield1(){
    field1.clear();
  }

  void clearfield2(){
    field2.clear();
  }

  void clearfield3(){
    field3.clear();
  }

  Padding textfieldwidget(bool cek,TextEditingController controller){
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        margin: EdgeInsets.only(left:20.0),
        child: TextFormField(
          enabled:cek==true ? true:false,
          keyboardType: TextInputType.number,
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.blue)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow),
                borderRadius: BorderRadius.circular(20.0)
            ),
          ),
        ),
      ),
    );
  }

  void shwotoast(String msg,{int duration,int gravity}){
    Toast.show(msg, context,duration: duration,gravity: gravity);
  }


 FlatButton buttonwidget(String symbol,VoidCallback calculate){
    return  FlatButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(20)
      ),
      onPressed: (){
        setState(() {
          if(cek1&cek2!=true && cek2&cek3!=true&& cek3&cek1!=true){
            shwotoast('Error!!! minimal ceklis 2 ',duration: 2,gravity: Toast.CENTER,);
          }else{
            calculate();
          }
        });
      },
      child: Text('x'),
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                textfieldwidget(cek1,field1 ),
                                textfieldwidget(cek2,field2 ),
                                textfieldwidget(cek3,field3 ),
                              ],
                            ),
                          ),
                          Container(
                            height: 280,
                            width: 130,
                            child: Expanded(
                              child: ListView(
                                children:listcheckbox.map((e) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 13),
                                    child: Checkbox(
                                      value: e.ischeck,
                                      onChanged: (value){
                                        setState(() {
                                          e.ischeck=value;
                                          if(e.checkid==1){
                                            cek1=e.ischeck=value;
                                            clearfield1();
                                          }else if( e.checkid==2){
                                            cek2=e.ischeck=value;
                                            clearfield2();
                                          }else{
                                            cek3=e.ischeck=value;
                                            clearfield3();
                                          }
                                        });
                                      },
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            onPressed: (){
                              setState(() {
                               kali();
                              });
                            },
                            child: Text('X'),
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            onPressed: (){
                              setState(() {
                                 bagi();
                              });
                            },
                            child: Text('/'),
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            onPressed: (){
                              setState(() {
                               tambah();
                              });
                            },
                            child: Text('+'),
                          ),
                          FlatButton(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            onPressed: (){
                              kurang();
                            },
                            child: Text('-'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Divider(color: Colors.black,endIndent: 3.0,height: 3.0,indent: 3,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Hasil',style: TextStyle(fontSize: 20),),
                          SizedBox(
                            width: 10,
                          ),
                          result.toString()=='null' ? Text('0',style: TextStyle(fontSize: 20),):Text('$result',style: TextStyle(fontSize: 20),)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
