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
		
		<uni-section title="其他" type="line" class="tools" style="background-color: white">
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

	import { getAllCommunication } from "@/api/communication.js"
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
	let toolData = [
	// 	{
	// 	icon: `${imgPath}images/info.png`,
	// 	name: '教师信息展示',
	// 	url: ''
	// },{
	// 	icon: imgPath + 'images/works.png',
	// 	name: '签到记录查看',
	// 	url: ''
	// },{
	// 	icon: imgPath + 'images/monitor.png',
	// 	name: '教师听课',
	// 	url: ''
	// },
	] 
	import { getToken } from "@/utils/request.js"
	import { ifFirstLogin} from "@/api/login.js"
	export default {
		onLoad() {
			wx.hideHomeButton()
			wx.login({
				success(res) {
					getToken(res.code).then(data => {
						console.log("token", data)
						uni.setStorageSync("token", data)
						//判断是否注册
						// ifnotlogins().then(res =>{
						// 	console.log(res)
						// 	if(res.data==""){
						// 		wx.navigateTo({
						// 			url:'../post/post'
						// 		})
						// 	}
						// })
						//判断是否登录
						ifFirstLogin().then(res => {
							console.log('已经登录，身份为:',res.data.garde)
							if(res.data == ""){
								wx.showToast({
									title:'请先登录!',
									duration:1500
								}).then(
								wx.redirectTo({
									url:'../authority/authority'					
								}))
							}
							// 跳转到教师页面
							 else if(res.data.garde === "2"){
								 wx.showToast({
								 	title:'',
								 	icon:'loading',
								 	duration:1500
								 }).then(
									wx.reLaunch({
							 		url:'../teachers/teachers'
							 	}))
							 }

						})				
					})
				}
			})

		},
		onShow() {
			
		},
		components: {
			carousel
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
		methods:{
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
   @import "./index.css";
</style>
