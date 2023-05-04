<template>
	<view>
		<uni-card title="研学通" sub-title="浙江农林大学数学与计算机科学学院" extra="登录" :thumbnail="avatar" @click="onClick">
		<text class="uni-body">注意事项：请同学和老师注册时，使用和学校绑定手机号相同的手机号，否则系统无法识别。</text>
		</uni-card>
		</uni-section>
		<uni-section title="登录"  type="line" padding>
		<uni-easyinput v-model="value" :styles="styles" :placeholderStyle="placeholderStyle" placeholder="请输入手机号"></uni-easyinput>
		<view>
		<button class="btnSubmit1" @tap="submit3">登录</button>
		</view>
		</uni-section>
	</view>
	</view>
</template>
<script>
	import { denglu } from "@/api/registers.js"
	import { getToken } from "@/utils/request.js"
	import { ifFirstLogin} from "@/api/login.js"
	export default {
		data() {
			return {
					value: '',
					password: '',
					placeholderStyle: "color:#2979FF;font-size:14px",
					styles: {
					color: '#2979FF',
					borderColor: '#2979FF',
					},
				    avatar: 'https://vkceyugu.cdn.bspapp.com/VKCEYUGU-dc-site/460d46d0-4fcc-11eb-8ff1-d5dcf8779628.png',
				    extraIcon:{
							   color: '#4cd964',
							   size: '22',
							   type: 'gear-filled'
			                }
		       }
			   },
		onLoad() {
			 wx.showToast({
			 					title: '请先登录!',
			 					icon: 'none',
			 					duration:1000
			              })
			wx.hideHomeButton()
		},
		onReady() {},
		methods:{
	onClick(e){
			wx.navigateTo({
			url:'../post/post'		
						})
			  },
	iconClick(type) {
			uni.showToast({
						title: `点击了${type==='prefix'?'左侧':'右侧'}的图标`,
					    icon: 'none'
					      })
		            },
	actionsClick(text){
			uni.showToast({
						title:text,
						icon:'none'
						 })
					   },
	submit3(){
				let that=this		
			    denglu(this.value).then(res => {
				console.log("登录成功",res)
				if(res.data.code == 0){
					ifFirstLogin().then(res=>{
						console.log('身份数字:',res.data.garde);
						if(res.data.garde === "2"){
								wx.reLaunch({
								url:'../teachers/teachers'
							})
							console.log('跳转到教师页面');
						}else if(res.data.garde ==="1"){
							wx.reLaunch({
							  url: '../index/index'
							})
							console.log('跳转到学生页面');
						}
					})

				}
				// wx.showToast({
				// 	title:res.data.msg,
				// 	icon:"none"
				// })

			}).catch(err =>{{
				console.log("登录失败",err)
			}})		
			}		
	},
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
</style>
