import 'package:explore/helpers.dart';
import 'package:explore/models/story_data.dart';
import 'package:explore/theme.dart';
import 'package:explore/widgets/avatar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class StorySelector extends StatelessWidget {
  const StorySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.0,
                    top: 8.0,
                    bottom: 16.0,
                  ),
                  child: Text('Stories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppColors.textFaded,
                  ),
      
                  ),
                ),
      
                 Padding(
                   padding: EdgeInsets.only(
                    left: 10.0,
                   ),
                   child: Text('.  .  .  .  .  .',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppColors.textFaded,
                ),
                   ),
                 ),
      
              ],
            ),
      
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                  final faker = Faker();
                  return  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical:10.0,
                      horizontal: 10.0,
                    ),
                    child: SizedBox(
                      width: 60,
                      child: _StoryCard(
                        storyData: StoryData(
                          name: faker.person.name(), 
                        url: Helpers.randomPictureUrl(),
                        ),
                      ),
                    ),
                  );
                }
                ),
            )
      
      
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({required this.storyData}) ;

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Avatar.medium(
          url: storyData.url
          ),
         const SizedBox(height: 5.0),

          Text(storyData.name,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
            fontSize: 11,

          ),

          
          )

      ]

    );
    
  }
}