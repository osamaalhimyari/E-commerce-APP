import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../app_links.dart';
import '../../data/model/item_model.dart';

class ListItemsSearch extends StatelessWidget {
  final List<ItemModel> listdatamodel;
  final Function(ItemModel item) onTap;
  const ListItemsSearch(
      {super.key, required this.listdatamodel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onTap(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLinks.imagestItems}/${listdatamodel[index].itemImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemNameEn!),
                          subtitle: Text(listdatamodel[index].catNameEn!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
