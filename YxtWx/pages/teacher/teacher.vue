<template>
	<view>
		<uni-card title="教师信息" sub-title="浙江农林大学数学与计算机科学学院"  :thumbnail="avatar">
		<text class="uni-body"></text>
		</uni-card>
		<view class="body">
			<view class="item" @tap="introduce">
				<view class="itemName" style="margin-left: 30rpx; ">
					教师姓名：{{name}}
				</view>
			</view>
			<view class="item" @tap="jumpScore">
				<view class="itemName" style="margin-left: 30rpx;">
					职称：{{}}
				</view>
			</view>
			<view class="item" @tap="jumpScore">
				<view class="itemName" style="margin-left: 30rpx;">
					工号：{{code}}
				</view>
			</view>
			<view class="item" @tap="jumpScore">
				<view class="itemName" style="margin-left: 30rpx;">
					学生列表：
				</view><view class="stu" style="margin-left: 60rpx; display:flex " v-for="(p,index) in list" :key="index">{{p}}</view>
			</view>
		</view>
		<view class="logout" @click="logout">
				<view class="logout" >
					退出登录
				</view>
		</view>
<!-- 		<uni-section title="认证"  type="line" padding>
		<uni-easyinput v-model="value" :styles="styles" :placeholderStyle="placeholderStyle" placeholder="请输入手机号"></uni-easyinput>
		<view>
		<button class="btnSubmit1" @tap="submit">认证</button>
		</view>
		</uni-section> -->
	</view>
	</view>
</template>
<script>
	// import { denglu } from "@/api/registers.js"
		import { logOut, logout } from "@/api/login.js"
		import{ifFirstLogin} from"@/api/login.js"
		import{findStudent} from"@/api/login.js"   
	export default {
		data() {
			return {
					code:'',
					name:'',
					list:[],
				    avatar: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/460d46d0-4fcc-11eb-8ff1-d5dcf8779628.png',
				    extraIcon:{
							   color: '#4cd964',
							   size: '22',
							   type: 'gear-filled'
			                }
		       }
			   },
		onLoad(){
			let that = this
			ifFirstLogin().then(res=>{
				console.log(res);
				that.name = res.data.userName
				that.code = res.data.code
			}).then(findStudent().then(res=>{
				that.list = res.data.result
				console.log(that.list);
			}))
		},
		methods:{
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
		},
		// onLoad() {},
		// onReady() {},
	// 	methods: {
	// submit(){
	// 		wx.navigateBack({
	// 		delta:1000,
	// 		success() {
	// 			wx.showToast({
	// 				title: '认证成功！',
	// 				icon: 'none',
	// 				duration:2000
	// 						})
	// 				  }
	// 			   })
								
	// 		  }	
	// },
	}
</script>

<style>
.btnSubmit1 {
		width: 180rpx;
		height: 80rpx;
		background: rgb(25,152,255);
		color: white;
		margin-top:10rpx;
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
</style>
