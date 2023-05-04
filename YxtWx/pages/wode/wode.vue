<template>
	<view class="container">
		<view class="head" v-if="denglu==false">	
			<view class="img">
				<image src="../../static/wode.png"  mode="widthFix" style="width: 200rpx;"></image>
			</view>
			<view class="name" style="color:white;font-size: 60rpx;">
			我的
			</view>
		</view>
		<view class="head" v-if="denglu==true">
			<view class="img">
				<image src="../../static/wode.png" mode="widthFix" style="width: 200rpx;"></image>
			</view>
			<view class="name" style="color:white;font-size: 60rpx;">
				userName
			</view>
			<view class="name" style="color:lightgrey;font-size: 40rpx;">
				community
			</view>
		</view>
		<view class="body">
			<view class="item" @click="introduce">
				<view class="icon">
					<image src="../../static/introduce.png" mode="widthFix" style="width: 60rpx;margin-left: 30rpx;"></image>
				</view>
				<view class="itemName" style="margin-left: 30rpx; ">
					我的信息
				</view>
			</view>
			<view class="item" @tap="jumpScore">
				<view class="icon">
					<image src="../../static/integral.png" mode="widthFix" style="width: 60rpx;margin-left: 30rpx;"></image>
				</view>
				<view class="itemName" style="margin-left: 30rpx;">
					我的积分
				</view>
			</view>
			<view class="logout" @click="logout">
					<view class="logout" >
						退出登录
					</view>
			</view>
		</view>
<!-- 		导航栏
					<tab-bar :current="currentTabIndex" @click="tabClick"></tab-bar> -->
	</view>
</template>

<script>
	import { logOut, logout } from "@/api/login.js"
	//import tabBar from'../../components/tabbar/tabbar.vue'   //引入导航栏组件
	export default {
		data() {
			return {
				// currentTabIndex: 1,
				denglu:false
			}
		},
		onShow(){
		},
		components: {
		//	tabBar
		},
		methods: {
			// tabClick(index) {    //导航栏方法
			// 			// console.log('返回tabBar索引：' + index)
			// 			this.currentTabIndex = index
			// 		},
			
			jumpScore(){
				wx.navigateTo({
					url:'./score/score'					
				})
			},
			introduce(){
				wx.navigateTo({
					url:'../my/my'					
				})
			},
			logout(){
				wx.showModal({
				  title: '提示',
				  content: '是否退出登录',
				  success (res) {
				    if (res.confirm) {
				      console.log('退出登录')
					  logOut().then(res=>{
						  console.log('退出成功');
						  uni.showToast({
						    icon:'success',
						    title:'退出成功'
						               })
						wx.reLaunch({
							url:'../authority/authority'
						})
					  })
				    } else if (res.cancel) {
				    }
				  }
				})
			}
		}
	}
</script>

<style>
.container {
	height: 100%;
	background: rgb(243,245,249);
}

.head {
	height: 400rpx;
	background: deepskyblue;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.body {
	display: flex;
	flex-direction: column;
}

.item {
	display: flex;
	flex-direction: row;
	height: 100rpx;
	align-items: center;
	background: #fff;
	margin-top: 20rpx;
}

	
.logout{
	height: 100rpx;
	flex-direction: row;
	background: #fff;
	text-align:center;
	margin-top: 20rpx;
	color : #ff5500;
	font-size : 30;
}

	tab-bar{
		position:fixed;
		display:flex;
		bottom:0;
		z-index:999;
		justify-content: space-around;
		width: 100%;
		margin: 0 auto;
		font-size: 40rpx;
		background-color: #f5f5f5;
		padding: 36rpx 0;
	}
</style>
