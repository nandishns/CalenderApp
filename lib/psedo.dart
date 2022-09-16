
import 'package:flutter_calender/events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calender(),
      darkTheme: ThemeData.dark(),

    );
  }
}

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  late Map<DateTime,List<Event>> selectedEvents;
  CalendarFormat format =CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController =TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    selectedEvents={};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date){
    return selectedEvents[date]??[];
  }

  @override
  void dispose() {
    _eventController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
         IconButton(
             onPressed:(){
               Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => const Rateus())
               );
         },
             icon: Icon(Icons.star)

         ),

        ],









        title:  Text("CALENDER",
          style: GoogleFonts.lato(),
        ),
        titleTextStyle: const TextStyle(
          fontWeight:FontWeight.bold,
          fontSize: 25,
        ),
        elevation: 10,
        toolbarHeight: 50,

        centerTitle: true,
        // backgroundColor: Colors.cyanAccent ,
        backgroundColor: Color(int.parse("0xff64ffda")),
      ),

      body: Column(
        children: [
          TableCalendar(
            focusedDay:selectedDay ,
            firstDay:DateTime(1990) ,
            lastDay:DateTime(2050) ,
            calendarFormat: format ,
            onFormatChanged: (CalendarFormat _format){
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.monday,

            //day changed
            onDaySelected: (DateTime selectDay,DateTime focusDay){
              setState(() {
                focusedDay= focusDay;
                selectedDay = selectDay;
              });
            },

            selectedDayPredicate: (DateTime date){
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            //style of calender
            calendarStyle:   CalendarStyle(
              cellMargin: EdgeInsets.all(8.0),
              cellPadding: EdgeInsets.all(4.0),
              defaultTextStyle: const TextStyle(
                color: Colors.white,
              ),
              weekendTextStyle:const TextStyle(
                color: Colors.white,),
              // outside decoration

              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                  color: Color(int.parse("0xff64ffda")),

                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1.5 ,
                      blurRadius: 5.0 ,
                    )
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(7.0)
              ),



              todayDecoration: BoxDecoration(
                  color: Colors.cyan,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1.5 ,
                      blurRadius: 8.0 ,
                    )
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0)
              ),



              defaultDecoration: BoxDecoration(
                  color: Colors.grey[900],
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0.5 ,
                      blurRadius: 1.0 ,
                    )
                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4.0)
              ),



              weekendDecoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0.5 ,
                      blurRadius: 1.0 ,
                    ) ],
                  color: Colors.grey[850],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(7.0)
              ),
            ),

            headerStyle: HeaderStyle(
                titleTextStyle:  const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 2,
                  color: Colors.cyan,
                  fontWeight:FontWeight.bold,
                ),
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.blueGrey[400],
                ),
                formatButtonTextStyle: TextStyle(

                  color: Colors.grey[200],
                )
            ),

          ),
          ..._getEventsfromDay(selectedDay).map((Event event) => ListTile(title:Text(event.title),)),
        ],
      ) ,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(context: context,
            builder: (context) => AlertDialog(
              title: Text("Add Event",style: GoogleFonts.ubuntu(),), content: TextFormField(controller: _eventController,),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context),
                    child: Text("Cancel",style: GoogleFonts.ubuntu())
                ),
                TextButton(
                    child: Text("OK",style: GoogleFonts.ubuntu()),
                    onPressed: () {
                      if (_eventController.text.isEmpty){
                        Navigator.pop(context);
                        return;
                      }
                      else {
                        if(selectedEvents[selectedDay]!=null)
                        {
                          selectedEvents[selectedDay]?.add(Event(title: _eventController.text),
                          );
                        }
                        else{
                          selectedEvents[selectedDay]=[Event(title: _eventController.text)
                          ];
                        }
                      }
                      Navigator.pop(context);
                      _eventController.clear();
                      setState(() {});
                      return;
                    }




                )
              ],
            )
        ),
        label: Text("Add Event",style:GoogleFonts.ubuntu()),
        icon: Icon(Icons.add),
      ) ,
    );
  }
}


class Rateus extends StatefulWidget {
  const Rateus({Key? key}) : super(key: key);

  @override
  State<Rateus> createState() => _RateusState();
}

class _RateusState extends State<Rateus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rate Us",style: GoogleFonts.ubuntu()),
        backgroundColor:  Color(int.parse("0xff64ffda")),
        centerTitle: true,
      ),
          body: SafeArea(

              child: Container(
               padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(120),

          child: RatingBar.builder(

            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )

              )

          )
    );

  }
}

