<template>
	<view>
		<uni-card title="我的信息" sub-title="浙江农林大学数学与计算机科学学院"  :thumbnail="avatar">
		<text class="uni-body"></text>
		</uni-card>
		<view class="body">
			<view class="item" >
				<view class="itemName" style="margin-left: 30rpx; ">
					姓名:{{name}}
				</view>
			</view>
			<view class="item" >
				<view class="itemName" style="margin-left: 30rpx;">
					手机号:{{phone}}
				</view>
			</view>
			<view class="item" >
				<view class="itemName" style="margin-left: 30rpx;">
					学号:{{code}}
				</view>
			</view>
			<view class="item" >
				<view class="itemName" style="margin-left: 30rpx;">
					性别:{{sex}}
				</view>
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
		import{ifFirstLogin} from"@/api/login.js"  
	export default {
		data() {
			return {
				code:'',
				name:'',
				phone:'',
				sex:''
			}
		},
		onLoad (){
			let that = this
			ifFirstLogin().then(res=>{
				that.name = res.data.userName
				that.code = res.data.code
				that.phone = res.data.phone
				that.sex = res.data.userSex
			})
		}
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
