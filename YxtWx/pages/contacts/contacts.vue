<template>
	<!-- <uni-section title="请输入你的意见" type="line" class="frame"> -->
<view class="example">
			<!-- 基础表单校验 -->
<uni-section title="请输入你的意见" type="line">
  <uni-forms>
	<uni-forms-item>
		<uni-easyinput  type="textarea" v-model="content" placeholder="请输入意见"/>
	</uni-forms-item>
  </uni-forms>
</uni-section>
<uni-section>
<button class="btn" @tap="submit">提交</button>
</uni-section>
</view>
<!-- 	</uni-section> -->
</template>

<script>
	// import { fmtDate } from "@/utils/formatTime.js"
	// import { postPhoto } from "@/api/photo.js"
	import { postopinion } from "@/api/contacts.js"
	export default {
		data() {
			return {
				content: "",
				// tempFilePaths: '',
				publishRules: {
					content: {
						rules:[
							{ required: true, errorMessage: '该项不能为空' }
						]
					}
				}
			}
		},
		methods: {
				submit(){
					 let that = this
					 const contentsearch = {
					 	content:this.content
					 }
					 postopinion(contentsearch).then(res => {
					       console.log(res.data);
					 						 wx.showToast({
					 						 	title: '上传成功！',
					 						 	icon: 'none',
					 						 	duration:2000
					 						 })
					 })
				     },
			// submit(formName) {
			// 	this.$refs[formName].validate().then(res=>{
			// 		this.publishForm.publishTime = fmtDate(Date.now())
			// 		for (var i = 0; i < this.tempFilePaths.length; i++) {
			// 			uploadFile(this.tempFilePaths[i]).then(res=>{
			// 				console.log('上传成功', res.result.fileAccessAdder);
			// 				this.publishForm.img = this.publishForm.img + res.result.fileAccessAdder + '|'
			// 			})
			// 		}
			// 		setTimeout(()=>{
			// 			postPhoto(this.publishForm).then(res=>{
			// 				console.log('发布随手拍', res.data);
			// 				if( res.data.code == 200 ) {
			// 					wx.showToast({
			// 						icon: 'success',
			// 						title: '提交成功'
			// 					})
			// 					this.$refs[formName].resetFields()
			// 					this.$refs['upload'].clearFiles()
			// 				}
			// 			})
			// 		}, 1000)
			// 	}).catch(err=>{
			// 		console.log(err);
			// 	})
			// },
		}
	}
</script>

<style>
	.example {
		padding: 5%;
		background-color: #fff;
		height: 500rpx;
	}
	
	.btn {
		background-color: #2979ff;
		color: white;
		bottom: 5%;
		width: 50%;
	}
	.lianxi{
		color: #00007f;
		text-align: left;
		margin-top: 50rpx;
	}
</style>
