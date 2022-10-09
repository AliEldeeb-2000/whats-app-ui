import 'package:flutter/material.dart';
import 'package:whats_up_ui/model/status_model/StatusHelper.dart';
import 'package:whats_up_ui/model/status_model/StatusItemModel.dart';

class StatusView extends StatelessWidget {
  const StatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: StatusHelper.itemCount,
      itemBuilder: (context, position) {
        StatusItemModel statusItemModel = StatusHelper.getStatusItem(position);
        if(position == 0){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20),
                child: Text('recent update', style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 15),),
              ),
              const Divider(),
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green , width: 2)
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(statusItemModel.image),
                  ),
                ),
                title: Text(statusItemModel.name , style: Theme.of(context).textTheme.headline6,),
                subtitle: Text("${statusItemModel.name} ${statusItemModel.dateTime}" , style: Theme.of(context).textTheme.bodyText1,),
              )


            ],
          );
        }else{
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20),
                child: Text('recent viewed', style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 15),),
              ),
              const Divider(),
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green , width: 2)
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(statusItemModel.image),
                  ),
                ),
                title: Text(statusItemModel.name , style: Theme.of(context).textTheme.headline6,),
                subtitle: Text("${statusItemModel.name} ${statusItemModel.dateTime}" , style: Theme.of(context).textTheme.bodyText1,),
              )


            ],
          );
        }
      },
    );
  }
}
