<template>
	
<uni-section title="注册" subTitle="请输入手机号和学号" type="line" padding>
		<uni-easyinput v-model="value1" :styles="styles" :placeholderStyle="placeholderStyle" placeholder="请输入手机号"></uni-easyinput>
		<uni-easyinput v-model="value2" :styles="styles" :placeholderStyle="placeholderStyle" placeholder="请输入学号"></uni-easyinput>
		<view>
		<button class="btnSubmit1" @tap="submit4">提交</button>
		</view>
		</uni-section>
	</uni-section>
</template>

<script>
	import{ zhuce } from "@/api/registers.js"
	export default{
		data(){
		  return{
			     value1:"",
			     value2:""
		        }
		      },
	methods:{
	  submit4(){
			uni.showToast({
			  icon:'success',
			  title:'注册成功'
		                 })
	// setTimeout(function(){wx.navigateTo({ url:"../authority/authority"});},1000)
    const zhuces={
	  stuPhone:this.value1,
	  stuCode:this.value2
		           }
	  // console.log(zhuces)
	  // zhuce(zhuces).then(res =>{
			// console.log("注册成功",res)
			// if(res.data.code ==0){
			// 	wx.showToast({
			// 		title:"注册成功",
			// 		icon:"none",
			// 		duration:500
			// 	})
			// 	wx.navigateBack({
			// 		delta:0
			// 	})
			// }
			// wx.showToast({
		 //    title:res.data.msg,
			// icon:"none"
		 //    })
			// }).catch(err=>{{
			// 	console.log("注册失败",err)
			// }})			
		    }	
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
</style>