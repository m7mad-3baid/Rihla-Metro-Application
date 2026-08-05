import 'package:flutter/material.dart';
import '../models/notificationsModel.dart';
import '../services/api_services.dart';

class NotificationsScreen extends StatelessWidget {

  const NotificationsScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Notifications"),
      ),


      body: FutureBuilder<List<NotificationModel>>(

        future: ApiService.getNotifications(),


        builder: (context, snapshot) {


          if(snapshot.connectionState == ConnectionState.waiting){

            return const Center(
              child: CircularProgressIndicator(),
            );

          }


          if(snapshot.hasError){

            return Center(
              child: Text("Error loading notifications"),
            );

          }


          if(snapshot.data == null || snapshot.data!.isEmpty){

            return const Center(
              child: Text("No notifications"),
            );

          }


          return ListView.builder(

            itemCount: snapshot.data!.length,


            itemBuilder: (context,index){

              final notification = snapshot.data![index];


              return Card(

                child: ListTile(

                  leading: const Icon(Icons.notifications),


                  title: Text(notification.title),


                  subtitle: Text(
                    "${notification.message}\n${notification.date}",
                  ),

                ),

              );

            },

          );

        },

      ),

    );

  }

}