<template>
	<view class="container">
		<carousel :img-list="swiperImgList" url-key="url" @selected="selectedBanner"/>
		<uni-section title="学生工具" type="line" class="tools" style="background-color: white">
		<view class="title" style="border: none; margin-top: 0;">
			<view v-for="(item, index) in listname" :key="index" class="icon_list">
				<view class="icon_i" @tap="onBtnTitle" :data-url="item.url">
					<image :src="item.icon"></image>
					<view class="icon_text">{{item.name}}</view>
				</view>
			</view>
		</view>
		</uni-section>
		
		<uni-section title="教师工具" type="line" class="tools" style="background-color: white">
			<view class="title" style="border: none; margin-top: 0;">
				<view v-for="(item, index) in toolList" :key="index" class="icon_list2" style="margin-bottom: 60rpx;">
					<view class="icon_i" @tap="onBtnTitle" :data-url="item.url">
						<image :src="item.icon"></image>
						<view class="icon_text">{{item.name}}</view>
					</view>
				</view>
			</view>
		</uni-section>
	</view>

</template>

<script>
	import carousel from '@/components/vear-carousel/vear-carousel';
	import { getAllCommunication } from "@/api/communication.js";
	// import { getNotice } from '@/api/notice.js'

	const app = getApp();
	let imgPath = "../../static/"
	let listData = [{
		icon: imgPath + 'images/report.png',
		name: '每日工作',
		url: '../xuanze/xuanze'
	},{
		icon: imgPath + 'images/daka.png',
		name: '每日打卡',
		url: '../photo/photo'
	},
	{
		icon: `${imgPath}images/questionnaire.png`,
		name: '农林资讯',
		url: '../lunbo/lunbo?current=1'
	},{
		icon: imgPath + 'images/paper.png',
		name: '投稿经验',
		url: '../experience/experience'
	}, 
	{		icon: `${imgPath}images/meiriyibao.png`,		name: '学生听课',		url: '../lesson/Timetable'	}, {
		icon: imgPath + 'images/contact.png',
		name: '联系我们',
		url: '../contacts/contacts'
	}];
	let toolData = [{
		icon: `${imgPath}images/info.png`,
		name: '教师信息',
		url: '../teacher/teacher'
	},{
		icon: imgPath + 'images/works.png',
		name: '学生打卡',
		url: '../teacher/estimate2'
	},
	{
		icon: imgPath + 'images/daka.png',
		name: '学生工作',
		url: '../works/works'
	},{
		icon: imgPath + 'images/monitor.png',
		name: '教师听课',
		url: '../grid/grid'
	},{
		icon: imgPath + 'images/vote.png',
		name: '学生评价',
		url:'../rate/rate'
	}
	] 
	import { getToken } from "@/utils/request.js"
	import { ifFirstLogin} from "@/api/login.js"
	export default {
		onLoad(){
			
			wx.hideHomeButton()
		},
		onShow() {
		},
		components: {
			carousel,
		},
		data() {
			return {
				listname: listData,
				toolList: toolData,
				noticeText: '',
				swiperImgList: [
					{
						url: 'https://www.zafu.edu.cn/__local/8/D3/16/432AD8FD7A7ED2658CCA4136280_FA57EE80_17C12.jpg',
						id: 1
					},
					{
						url: 'https://www.zafu.edu.cn/__local/B/70/85/2BAB28AF279FAA9DAA54FB72CAC_A19DCA3F_136B9.jpg',
						id: 2
					}
				],
				communicationInfo: []
			}
		},
		methods: {
				
			selectedBanner(item, index) {
				console.log('🥒', item, index)
			},
			onBtnTitle: function(event) {
				var data = event.currentTarget.dataset;
				wx.navigateTo({
					url: data.url
				});
			},
			getMore() {
				wx.navigateTo({
					url: './notice/notice'
				});
			},
		}
	}
</script>

<style>
   page {
     width: 100%;
     height: 100%;
   }
   /**index.wxss**/
   .container {
     width: 100%;
     height: 100%;
     margin: 0rpx;
     padding: 0rpx;
     display: flex;
     flex-direction: column;
   }
   
   /* 轮播插件 */
   .posts-swiper {
     width: 100%;
     height: 350rpx;
   }
   
   .posts-swiper-img {
     width: 100%;
     height: 350rpx;
   }
   
   /* ******************************************** */
   
   .btns {
     height: calc(100% - 100rpx);
     overflow-x: hidden;
     overflow-y: auto;
   }
   
   .title {
     width: 90%;
     color: #333333;
     font-family: "微软雅黑";
     text-align: center;
     font-size: 26rpx;
     background-color: white;
     margin-left: 5%;
     margin-top: 20rpx;
     border-radius: 10px;
     border: 1px solid rgb(242, 240, 233);
   }
   .tools {
     margin-top: 60rpx; 
     height: 100%; 
     margin-bottom:50rpx;
     border: 1px solid rgb(242, 240, 233);
     border-radius: 10px;
     margin-left: 5%;
     margin-right: 5%;
     
   }
   
   .ssmz {
     width: 90%;
     height: 200rpx;
     color: #333333;
     font-family: "微软雅黑";
     text-align: center;
     font-size: 26rpx;
     background-color: white;
     margin-left: 5%;
     margin-top: 20rpx;
     border-radius: 10px;
     border: 1px solid rgb(242, 240, 233);
   }
   
   .numBox {
     height: 130rpx;
     background-color: rgba(0, 0, 0, 0.66);
   }
   
   .noticeBox{
     height: 80rpx;
   }
   
   .ssmz .ssmzLabel {
     float: left;
     margin-top: 20rpx;
     font-size: 32rpx;
     font-weight: bold;
     width: 100%;
     text-align: center;
   }
   
   .ssmz .ssmzLabel2 {
     float: left;
     margin-top: 25rpx;
     font-size: 24;
     font-weight: bold;
     /* width: 100%; */
     margin-left: 10rpx;
     text-align: center;
     color: gray;
   }
   
   .ssmz .ssmzLabel3 {
     margin-top: 10rpx;
     font-size: 32rpx;
     font-weight: bold;
     width: 100%;
     text-align: center;
     display: inline-block;
     color: #d2d2d2;
   }
   
   
   .ssmz image {
   
     width: 140rpx;
     height: 140rpx;
     margin-top: 20rpx;
   }
   
   .ssmz .image2 {
     width: 200rpx;
     height: 200rpx;
     margin-top: 20rpx;
     margin-left: 30rpx;
     display: block;
     float: left;
   }
   
   .ssmz .image3 {
     width: 42rpx;
     height: 42rpx;
     margin-top: 20rpx;
     margin-left: 30rpx;
     display: block;
     float: left;
   }
   
   .noticeLabel {
     float: left;
     height: 80rpx;
     line-height: 80rpx;
     width: 70%;
     text-overflow: ellipsis;
     overflow: hidden;
     white-space: nowrap;
     font-size: 12px;
     text-align: left;
     margin-left: 10px;
   }
   
   .btnMore {
     float: left;
     height: 80rpx;
     line-height: 80rpx;
     width: 15%;
     font-size: 12px;
     color: #3468ff;
   }
   
   
   .icon_list {
     width: 32%;
     display: flex;
     flex-direction: row;
     justify-content: center;
     float: left;
     margin-top: 30rpx;
     margin-bottom: 30rpx;
   
   }
   
   .icon_list2 {
     width: 33.3%;
     display: flex;
     flex-direction: row;
     justify-content: center;
     float: left;
     /* margin-top: 30rpx; */
     margin-bottom: 30rpx;
   }
   
   .text-ell {
   	word-break: break-all;
   	text-overflow: ellipsis;
   	display: -webkit-box;
   	-webkit-box-orient: vertical;
   	-webkit-line-clamp: 2;
   	overflow: hidden;
   }
   
   .ssmz .item {}
   
   .icon_i {
     flex-direction: column;
   
   }
   
   .icon_i image {
     width: 64rpx;
     height: 64rpx;
   }
   
   .icon_i .image2 {
     width: 40rpx;
     height: 40rpx;
   }
   
   
   .icon_text {
     height: 24rpx;
     text-align: center;
     margin-top: 15rpx;
     font-weight: bold;
   }
   
   
   .new_img {
     width: 750rpx;
     height: 400rpx;
     padding-top: 30rpx;
     display: box;
   
   }
   
   .new_img image {
     width: 750rpx;
     height: 400rpx;
     padding-top: 30rpx;
   }
   
   .tab {
     width: 750rpx;
     height: 90rpx;
     color: #333333;
     font-family: "微软雅黑";
     text-align: center;
     font-size: 26rpx;
     font-weight: bold;
     position: fixed;
     bottom: 0px;
     /* border-top: 1rpx solid rgba(0, 0, 0, 0.3); */
     padding-top: 10rpx;
     background-color: white;
   }
   
   .tab_list {
     width: 33.3%;
     display: flex;
     justify-content: center;
     flex-direction: row;
     float: left;
   }
   
   .tab_i {
     flex-direction: column;
     width: 100%;
   }
   
   .tab_text {
     height: 24rpx;
     text-align: center;
     padding-bottom: 10rpx;
   }
   
   .tab_i image {
     width: 48rpx;
     height: 48rpx;
   }
   
   .tab_i .zxj {
     width: 80rpx;
     height: 80rpx;
     border: 5px solid white;
     border-radius: 50%;
     margin-top: -58rpx;
   }
   
   .pohoto_box {
     width: 750rpx;
     height: 64px;
     position: fixed;
   }
   
   .pohoto_box image {
     width: 80rpx;
     height: 80rpx;
     margin-top: -35rpx;
   }
   
   
	.my-sub-tabbar-wrapper {
		position: fixed;
		bottom: 0;
		left: 0;
		width: 100%;
	}
	
	.uni-tabbar__icon {
		height: 20rpx;
		width: 20rpx;
	}
</style>
