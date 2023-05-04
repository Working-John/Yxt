<template>
<view>
<uni-card is-full>
		<uni-forms-item label="填报时间" class="example-body">
				<uni-datetime-picker type="datetime" return-type="timestamp" v-model="gettime"/>
		</uni-forms-item>
</uni-card>
<uni-section title="工作打卡" type="line">
		<view class="uni-px-5 uni-pb-5">
		<uni-data-checkbox multiple v-model="checkbox1" :localdata="hobby" @change="change"></uni-data-checkbox>
	    </view>
		<uni-forms-item>
		     <uni-easyinput type="textarea" v-model="getpassage" placeholder="请输入工作详情" />
		</uni-forms-item>
</uni-section>
<uni-section title="自我评定" type="line">
	<view class="uni-px-5 uni-pb-5">
		<view class="text">评定标准</view>
		<uni-data-checkbox v-model="radio1" :localdata="hobby2" @change="change1"></uni-data-checkbox>
		<button class="btnSubmit1" @tap="submit2">提交</button>
	</view>
</uni-section>
<!-- 				<uni-forms ref="baseForm" :modelValue="baseFormData">
				</uni-forms> -->
				<!-- <button class="btnSubmit1" @tap="submit2">提交</button> -->
</view>
</template>

<script>
	import { dayUp } from "@/api/dayUp.js"
	const app = getApp();
	export default {
		data() {
			return {
				getpassage:"",
				gettime: "",
				radio1:[],
				checkbox1: [],
				checkbox2: [],
				todayCompelete:[],
				myselfScore:"",
				hobby: [{
						text: '上课',
						value: 0
						}, {
						text: '读文献',
						value: 1
						},{
						text: '做实验',
						value: 2
						}, {
						text: '写论文',
						value: 3
						},{
						text: '出差',
						value: 4
						},{
						text: '其他',
						value: 5
						},
						],
				hobby2: [{
						text: '优秀',
						value: 0
						}, {
						text: '良好',
						value: 1
						}, {
						text: '普通',
						value: 2
						}],
			}
		},
		methods: {
			change(e){
				console.log(e)
				this.todayCompelete = e.detail.data
			},
			change1(e){
				console.log(e)
				this.myselfScore = e.detail.data.text
			},
			submit2(){
				let that = this
				if (that.name == ''){
					wx.showToast({
						title:'请输入姓名',
						icon:'error'
					})
					return
				}
				let todayCompeleteStr = ""
				for(let item of this.todayCompelete){
					todayCompeleteStr = todayCompeleteStr + item.text + "|"
					// todayCompeleteStr = todayCompeleteStr + item.text
				}
				const dayUpData = {
					statue:todayCompeleteStr,
					judge:this.myselfScore,
					passage:this.getpassage
					
				}
				dayUp(dayUpData).then(res => {
					wx.navigateBack({
						delta:2000,
						success() {
							wx.showToast({
								title: '上传成功！',
								icon: 'none',
								duration:2000
							})
						}
					})
				}).catch(err => {{
					console.log("每日一报上传失败", err)
				}})	
			},
			    getTime() {
			     var _this = this;
			       let yy = new Date().getFullYear();
			       var mm =
			         new Date().getMonth() > 9
			           ? new Date().getMonth() + 1
			           : new Date().getMonth() == 9
			           ? new Date().getMonth() + 1
			           : '0' + (new Date().getMonth() + 1);
			       var dd = new Date().getDate() < 10 ? '0' + new Date().getDate() : new Date().getDate();
			       let hh = new Date().getHours();
			       let mf =
			         new Date().getMinutes() < 10 ? '0' + new Date().getMinutes() : new Date().getMinutes();
			       let ss =
			         new Date().getSeconds() < 10 ? '0' + new Date().getSeconds() : new Date().getSeconds();
			       _this.gettime = yy + '-' + mm + '-' + dd + ' ' + hh + ':' + mf;
			     },
			     currentTime() {
			       setInterval(this.getTime, 1000);
			     },
			    
			   },
			   mounted() {
			     this.currentTime();
			 
			 
			 
			 
			 
			 
		},
	}
</script>

<style lang="scss">
	.text {
		font-size: 12px;
		color: #666;
		margin-top: 5px;
	}
	.uni-px-5 {
	    padding-left: 10px;
	    padding-right: 10px;
	}
	.uni-pb-5 {
	    padding-bottom: 10px;
	}
	.btnSubmit1 {
		width: 200rpx;
		height: 80rpx;
		background: rgb(25,152,255);
		color: white;
		margin-top:10rpx;
	}
	.example-body {
			/* #ifndef APP-NVUE */
			display: block;
			/* #endif */
			padding: 10px;
	}
	.typeling{
	        display: flex;
			}
</style>