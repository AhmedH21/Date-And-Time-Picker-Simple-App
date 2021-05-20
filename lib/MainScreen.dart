import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime pickedDate;
  TimeOfDay time;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date And Time Picker"),
        centerTitle: true,
      ),
      body: Builder(builder: (context){
        return Center(
          child: Container(
            child: InkWell(
              onTap: _pickDateAndTime,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff606576),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width * .6,
                height: MediaQuery.of(context).size.height * .04,
                child: Center(
                  child: Text(
                    'Choose Date And Time',
                    style: TextStyle(
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        );
      },),
    );
  }

/// LOGIC CODE
  void _pickDateAndTime() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }

    TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: time,
    );

    if (newTime != null) {
      setState(() {
        time = newTime;
      });
    }

    SnackBar dateSnackBar= SnackBar(duration: Duration(milliseconds: 455),content: Text("📅 Date : ${date.day} / ${date.month} / ${date.year}"));
    ScaffoldMessenger.of(context).showSnackBar(dateSnackBar);

    SnackBar timeSnackBar= SnackBar(duration: Duration(milliseconds: 455),content: Text("🕒 Time : ${time.hour} : ${time.minute}"));
    ScaffoldMessenger.of(context).showSnackBar(timeSnackBar);


  }
}
