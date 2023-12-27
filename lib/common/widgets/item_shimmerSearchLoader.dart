import 'package:flutter/material.dart';

class ItemLoaderSearchPage extends StatelessWidget {
  const ItemLoaderSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 140,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const ContainerTextLoader(),
                  const SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 13,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ContainerTextLoader(),
                  const SizedBox(
                    height: 15,
                  ),
                  const ContainerTextLoader(),
                  const SizedBox(
                    height: 15,
                  ),
                  const ContainerTextLoader(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContainerTextLoader extends StatelessWidget {
  const ContainerTextLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 13,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
      ),
    );
  }
}
