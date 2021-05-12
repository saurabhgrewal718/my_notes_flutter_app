import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../themes.dart';


class Idea extends StatefulWidget {
  @override
  _IdeaState createState() => _IdeaState();
}

class _IdeaState extends State<Idea> {
  // final _auth = FirebaseAuth.instance;
  final _form = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  String _idea = '';
  DateTime _date;
  String _formattedDate='';
  String _formattedTime='';
  var _isLoading= false;

  @override
  void _saveForm() async{
    _form.currentState.validate();
    FocusScope.of(context).unfocus();
    _form.currentState.save();
    print(_idea);
    print(_formattedDate);
    print(_formattedTime);
    Navigator.of(context).pop();

  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Form(
            key: _form,
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    
                    SizedBox(height: 30,),
                    Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          maxLines: 10,
                          validator: (value){
                            if(value.isEmpty || value.length <4){
                              return "Idea Must have Alteast 4 Characters";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400])
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400])
                            ),
                          ),
                          onSaved: (value){
                            _idea=value;
                            _date=DateTime.now();
                            _formattedDate = DateFormat('yyyy-MM-dd').format(_date);
                            _formattedTime = DateFormat('kk:mm').format(_date);
                          },
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(currentDate.toString()),
                            MaterialButton(
                              onPressed: () => _selectDate(context),
                              color: Colors.greenAccent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Text("Select Date", style: TextStyle(
                                fontWeight: FontWeight.w600, 
                                fontSize: 14,
                                color: Colors.black45
                              ),),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),
                  ),
                  
                    _isLoading ? Center(child:CircularProgressIndicator(backgroundColor: Colors.greenAccent)) : Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                            _saveForm();
                        },
                        color: Colors.greenAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Text("Add Idea", style: TextStyle(
                          fontWeight: FontWeight.w600, 
                          fontSize: 18,
                          color: Colors.black45
                        ),),
                      ),
                    ),           
                   ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}





