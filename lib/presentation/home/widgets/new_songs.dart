import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_flow/common/helpers/is_dark_mode.dart';
import 'package:melody_flow/core/configs/const/app_url.dart';
import 'package:melody_flow/core/configs/theme/app_colors.dart';
import 'package:melody_flow/domain/entities/song/song.dart';
import 'package:melody_flow/presentation/home/bloc/new_song_cubit.dart';
import 'package:melody_flow/presentation/home/bloc/new_song_state.dart';
import 'package:melody_flow/presentation/song_player/song_player.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
            builder: (context, state){
              if (state is NewsSongsLoading) {
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator()
                );
              }

              if (state is NewsSongsLoaded) {
                return _songs(
                    state.songs
                );
              }
              if(state is NewsSongsLoadFailure){
                return Container(
                    alignment: Alignment.center,
                    child: const Icon(Icons.error)
                );
              }
              return Container();
            }
        )

      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated( //  danh sách có khoảng cách (divider) giữa các item mà không cần thêm divider vào danh sách chính.
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context,index) {
          String songTitle = Uri.encodeComponent(songs[index].title);
          // print('${AppUrls.CoversFirestorage}${songTitle}.jpg?${AppUrls.mediaAlt}');
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context)
                      => SongPlayerPage(
                        songEntity: songs[index],
                      )
                  )
              );
            },
            child: SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                              //AssetImage('assets/images/Ánh_đèn_phố.jpg'),
                              NetworkImage('${AppUrls.coverFirestorage}${songs[index].artist} - ${songs[index].title}.jpg?${AppUrls.mediaAlt}',
                                //"https://firebasestorage.googleapis.com/v0/b/audiora-fa05c.firebasestorage.app/o/covers%2FShape%20of%20you.jpg?alt=media"
                              ),
                          )
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 40,
                          width: 40,
                          transform: Matrix4.translationValues(10, 10, 0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.isDarkMode ?  AppColors.darkGrey : const Color(0xffE6E6E6)
                          ),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: context.isDarkMode ? const Color(0xff959595) : const Color(0xff555555),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    songs[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                    ),
                  ) ,
                  const SizedBox(height: 5,),
                  Text(
                    songs[index].artist,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context,index) => const SizedBox(width: 14,),// khoang cach giua cac box
        itemCount: songs.length
    );
  }
}

