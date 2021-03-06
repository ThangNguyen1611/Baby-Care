import 'package:flutter/material.dart';
import 'package:flutter_babycare/module/chatcenter/p2p/view/chat_p2p.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_constants.dart';
import '../../../../utils/app_colors.dart';

class ChatCenterView extends StatefulWidget {
  static const routeName = '/chat-center';

  const ChatCenterView({Key key}) : super(key: key);

  @override
  _ChatCenterViewState createState() => _ChatCenterViewState();
}

class _ChatCenterViewState extends State<ChatCenterView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.paddingAppW,
        vertical: AppConstants.paddingAppH,
      ),
      color: AppColors.background,
      height: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return _buildDirectButton(
            title: 'Caring center',
            description: 'Get advices by chatting with us',
            action: () {
              Navigator.pushNamed(
                context,
                ChatP2PView.routeName,
                arguments: ChatP2PViewArguments('Caring center', null),
              );
            },
            image: AssetImage('assets/image/logo_s150.png'),
            isRedFrame: index % 2 == 1 ? true : false,
          );
        },
      ),
    );
  }

  Widget _buildDirectButton({
    String title,
    String description,
    Function action,
    ImageProvider image,
    bool isRedFrame = false,
  }) {
    return Container(
      height: 132.h,
      margin: EdgeInsets.symmetric(vertical: AppConstants.paddingNormalH),
      child: ElevatedButton(
        onPressed: action,
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                          color: AppColors.whiteBackground,
                        ),
                      ),
                    ),
                    SizedBox(height: AppConstants.paddingNormalH),
                    Container(
                      child: Text(
                        description,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColors.whiteBackground,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppConstants.paddingNormalW),
              Container(
                height: double.infinity,
                margin: EdgeInsets.only(
                    top: AppConstants.paddingNormalH,
                    bottom: AppConstants.paddingLargeH),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppConstants.cornerRadiusFrame),
                  child: Image(
                    width: 100.w,
                    fit: BoxFit.cover,
                    image: image,
                  ),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.only(
            top: AppConstants.paddingNormalH,
            left: AppConstants.paddingLargeW,
            right: AppConstants.paddingLargeW,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isRedFrame == false
                  ? [
                      AppColors.primary,
                      AppColors.secondary,
                    ]
                  : [
                      AppColors.danger,
                      AppColors.highlighter,
                    ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(AppConstants.cornerRadiusFrame),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 4,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          primary: AppColors.primary,
          onPrimary: AppColors.solidButtonPress,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.cornerRadiusFrame),
          ),
        ),
      ),
    );
  }
}
