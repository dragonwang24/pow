var $mpShare = {
    desc: "分享内容",
    title: "分享标题",
    timelineTitle: "分享标题",
    imgUrl: "http://img5.imgtn.bdimg.com/it/u=183656797,1730936710&fm=21&gp=0.jpg",
    link: "http://www.iiipow.com:8188/pow/pages/announcements/announcements_list.jsp"
};
//@{
//    string[] list = {"onMenuShareTimeline", "onMenuShareAppMessage"};

//    var setting = Html.Raw(WeixinAdepter.GetJSSDKConfig(appkey, list).ToJson());
//}
//微信接口配置
$mpShare.timelineTitle = $mpShare.timelineTitle || ($mpShare.title + "\r\n" + $mpShare.desc);
if (wx) {
    wx.ready(function () {
        wx.onMenuShareTimeline({
            title: $mpShare.timelineTitle, // 分享标题
            link: $mpShare.link + ($mpShare.sn ? ("&sn=" + $mpShare.sn) : ""), // 分享链接
            imgUrl: $mpShare.imgUrl, // 分享图标
            success: function () {
                if ($mpShare.callback) {
                    $mpShare.callback();
                }
            },
            cancel: function () {
            }
        });
        wx.onMenuShareAppMessage({
            title: $mpShare.title, // 分享标题
            desc: $mpShare.desc, // 分享描述
            link: $mpShare.link + ($mpShare.sn ? ("&_share_sn=" + $mpShare.sn) : ""), // 分享链接
            imgUrl: $mpShare.imgUrl, // 分享图标
            //type: $mpShare.type, // 分享类型,music、video或link，不填默认为link
            //dataUrl: $mpShare.dataUrl, // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                if ($mpShare.callback) {
                    $mpShare.callback();
                }
            },
            cancel: function () {
            }
        });
    });
    wx.error(function (res) {
        alert(res);
    });
}