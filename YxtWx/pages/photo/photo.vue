<template>
	<view class="container">

	<uni-section title="每日打卡" type="line">
		<view class="example">
			<view class="example-body">
				<uni-dateformat :date="now"></uni-dateformat>
				<view :date="text" :class="mood1">
					今日{{text}}
				</view>
				</view>
			<!-- 基础表单校验 -->
			<uni-forms ref="publishForm" :rules="publishRules" :modelValue="publishForm" label-position="top">
            <image style="width: 100%;" :src="img"></image> 
<!-- 				
					<map id="myMap" markers="{{markers}}" style="width:100%;height:100vh;" longitude="{{poi.longitude}}" latitude="{{poi.latitude}}" scale='16' show-location>
					</map> -->
	<!-- 			<uni-forms-item label="注意" required name="title">
					<uni-easyinput v-model="publishForm.title" placeholder="必须在指定区域内才可打卡成功" />
				</uni-forms-item> -->
<!-- 				<uni-forms-item label="请拍照上传" required name="img" labelWidth="100">
					<uni-file-picker limit="3" ref="upload" :autoUpload="false" @select="selectImg"></uni-file-picker>
				</uni-forms-item> -->
				<!-- <button class="btnSubmit1" @tap="submit3">获取位置信息</button> -->
			</uni-forms>
			<!-- <button class="btn" @click="submit('publishForm')">发布</button> -->
		</view>
		<button  class="checkInBtn" @tap="submit3" :class="mood2">签到</button>
	</uni-section>
    </view>
</template>

<script>
	import {examine1} from "@/api/dayUp.js";
	import { ref } from "vue";
	import { ifFirstLogin} from "@/api/login.js";
	const {fmtDate} = require("@/utils/formatTime.js")
	const {uploadFile} = require("@/api/upload.js")
	const {postPhoto} = require ("@/api/photo.js")

	var QQMapWX = require('@/libs/qqmap-wx-jssdk.min.js');
	var qqmapsdk;
	let currentDate;
	const app = getApp();
	export default {
		data() {
			return {
				img:'https://ie.zafu.edu.cn/__local/F/52/18/51AA5CB8438BF57C1506283D9D7_76CFA67A_16429.jpg',
				mood1:'ok2',
				mood2:'',
				panduan:'false',
				consquence:'',
				text:'未打卡',
				now: Date.now(),
				date:'',
				stuname:'',
				list1:[],            //今日本人打卡表
				publishRules: {
					title: {
						rules:[
							{ required: true, errorMessage: '该项不能为空' }
						]
					},
					content: {
						rules:[
							{ required: true, errorMessage: '该项不能为空' }
						]
					}
				}
			}
		},
		onLoad(){					
									let that = this
								        qqmapsdk = new QQMapWX({
										key: 'NO3BZ-TO5WX-I2Z4W-ZSNVH-BIFYV-SNBE6'
									});
									this.getDate()
									console.log(that.date);
									this.selectToday()
									
		},
		onShow(){
									this.selectToday()
		},
methods: {
	getDate(){
				let that = this
	          const date = new Date();
	          let year = date.getFullYear();
	          let month = date.getMonth() + 1;
	          let day = date.getDate();
			  month = month > 9 ? month : '0' + month;
			  day = day > 9 ? day : '0' + day;
			  this.date = `${year}-${month}-${day}`;
			  
			  },
    submit3(){
		let that = this
		this.selectToday()
		if(
			that.panduan === 'true'
		){
			wx.showToast({
				title:'已经打卡！',
				icon:'error',
				duration:2000
			})
		}else{
	     uni.showLoading({
		      title: '获取定位中'
	          });
	     uni.getLocation({
		      type: 'wgs84',
		      success: function(resp) {
				  console.log("resp", resp)
			  let latitude = resp.latitude; 
			  let longitude = resp.longitude;
			  uni.hideLoading();
			  if ((Math.abs(longitude - 119.72694923057148) < 0.0007) && (Math.abs(latitude - 30.259463391459132) < 0.0007)){
				  that.consquence = 'success',
				  postPhoto(that.consquence).then(res => {
				  console.log("上传成功",res)
				  })

				  console.log("eg")
				  wx.showToast({
					title: '签到成功',
					icon: 'success',
					duration:3000
				               })
							   setTimeout(function(){wx.navigateBack({
								   delta:1
							      })
							   },1000)
			  }
			  else {
				  wx.showToast({
				  	title:'不在区域内',
				  	icon:'error'
				  })
				  return
			  }
		    },
		})
	}
            },	
		selectToday(){
			let that = this
			ifFirstLogin().then(res=>{
				that.stuname=res.data.userName
			//	console.log(that.stuname);
			})
			examine1(that.date).then(res=>{
				that.list1 = res.data.result
			//	console.log('今日打卡表:',that.list1);
			}).then(res=>{
				for(let i=0;i<that.list1.length;i++){
					if(that.list1[i].name===that.stuname){
						that.text = '已打卡'
						that.mood1 = 'ok1'
						that.mood2 = 'checkInBtn2'
						that.panduan='true'
					}
					else{
						that.panduan='false'
					}
				}
			})
			
		}         //查询今日是否打卡
        },	
	}

</script>

<style>
	.ok1{
		background-color: #aaff00;
		width: 180rpx;
		padding: 10rpx;
		border-style: solid;
		border-color: #b9de00;
	}
	.ok2{
		background-color: #ff6c6c;
		width: 180rpx;
		padding: 10rpx;
		border-style: solid;
		border-color: #d45a5a;
	}
	.example {
		padding: 5%;
		background-color: #fff;
	}
	
	.btn {
		background-color: #2979ff;
		color: white;
		position: fixed;
		bottom: 5%;
		width: 90%;
	}
	.btnSubmit1 {
			width: 300rpx;
			height: 80rpx;
			background: rgb(0, 255, 127);
			color: white;
			margin-top:10rpx;
		}
	.checkInBtn{
		  width: 280rpx;
		  height: 280rpx;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  flex-direction: column;
		  position: absolute;
		  left: calc(50% - 140rpx);
		  z-index: 12;
		  border-radius: 50%;
		  background-image: linear-gradient(180deg, #00a0e9 0%, #0095e9 73%, #0089e9 100%);
		  box-shadow: 0 0 10rpx 0rpx #0089e9;
	}
	.checkInBtn2{
		display:none;
	}
</style>
