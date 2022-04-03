import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/models/notification_model.dart';
import 'package:todo_app/core/utils/size_config.dart';
import 'package:todo_app/screens/notifications_list_page/cubit/notifications_lists_cubit.dart';

class NotificationsListPage extends StatelessWidget {
  const NotificationsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NotificationsListsCubit>().getNotifMessages();
    return BlocConsumer<NotificationsListsCubit, NotificationsListsState>(
      
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NotificationsListsLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is NotificationsListsLoaded) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(10),
              vertical: getHeight(10),
            ),
            child: state.messages.isEmpty
                ? const Center(
                    child: Text("No Message"),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return NotificaitonListTile(
                        message: state.messages[index],
                      );
                    },
                    itemCount: state.messages.length,
                  ),
          );
        }
        return const Center(child: Text("Somthing went wrong"));
      },
    );
  }
}

class NotificaitonListTile extends StatelessWidget {
  NotificaitonListTile({required this.message, Key? key}) : super(key: key);
  NotificationMessageModel message;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.2,
        children: [
          SlidableAction(
            onPressed: (v) async {
              context.read<NotificationsListsCubit>().deleteMessage(message);
            },
            backgroundColor: const Color(0xFFFFCFCF),
            foregroundColor: Colors.red,
            icon: Icons.delete_forever_outlined,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Card(
          margin: EdgeInsets.symmetric(vertical: getHeight(5), horizontal: 0),
          elevation: 2,
          shape: const Border(
            left: BorderSide(
              color: Colors.amberAccent,
              width: 5,
            ),
          ),
          shadowColor: Colors.grey.shade200,
          child: ListTile(
            subtitle: Text(message.time!),
            contentPadding: EdgeInsets.symmetric(
              horizontal: getWidth(18.0),
            ),
            title: Text(

              message.title!,
              style: TextStyle(
                  color: message.isRead!? Constants.dateTextColor: Constants.textColor,

                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              onPressed: () async {
                context.read<NotificationsListsCubit>().markAsRead(message);
              },
              icon: Icon(
                message.isRead! ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
