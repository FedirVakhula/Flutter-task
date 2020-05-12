import 'package:devsteam/services/navigation.dart';
import 'package:devsteam/ui/photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pfoto_bloc/photo_bloc.dart';

final PhotoBloc photoBloc = new PhotoBloc();

void main() => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<PhotoBloc>(
            create: (_) => photoBloc,
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: NavigationService.generateRoute,
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: BlocBuilder<PhotoBloc, PhotoState>(
          builder: (context, state) {
            if (state.photoList.isEmpty) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 0.0),
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColorDark
                    ],
                    tileMode: TileMode.repeated,
                  ),
                ),
                child: ListView.builder(
                  itemCount: state.photoList.length,
                  itemBuilder: (context, i) {
                    return PhotoWidget(
                      photo: state.photoList[i],
                    );
                  },
                ),
              );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<PhotoBloc>(context).add(PhotoFetchingEvent());
    super.initState();
  }
}
