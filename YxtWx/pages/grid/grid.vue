<template>
	
		<view style="display: flex;flex-direction: column;">
			<view class="head">
				<view class="head-text">
				教师听课
				</view>				
			</view>
			<view class="body">
				<view class="content-Box">
					<uni-section title="听课内容"  type="line" padding>
						<uni-forms ref="form" >
							<uni-forms-item label="教师" required>
								<uni-easyinput v-model="teachername" placeholder="任课教师" />
							</uni-forms-item> 
								
								<picker @change="examinationType" :range="examinationTypeArray">
									<uni-forms-item label="课程" required>
									<!-- <label>考试类型：</label> -->
									<label class="">{{ examinationTypeArrayType }}</label>
									</uni-forms-item>
							    </picker>
							<!-- </view> -->
							<!-- <uni-forms-item label="课程" required>
								<uni-easyinput v-model="phone" placeholder="课程名" /> -->
							<!-- </uni-forms-item> -->
							<uni-forms-item label="备注" required>
								<uni-easyinput v-model="temperature" placeholder="备注" />
							</uni-forms-item>
							<uni-forms-item label="请上传照片" required>
								<uni-file-picker :auto-upload="false" @select="selectImg" :limit="1" />
							</uni-forms-item>
						</uni-forms>
					</uni-section>
				</view>
			<view class="btn-Box">
				<button class="btnSubmit1" @tap="submit">提交</button>
				<!-- <button class="btnSubmit2">提交</button> -->
			</view>
			
			</view>
		</view>
	
</template>

<script>
	const {addTeacher} = require('@/api/grid')
	const {fmtDate} = require('@/utils/formatTime.js')
	const {uploadFile} = require('@/api/upload.js')
	const app = getApp()
	
	export default {
		data() {
			return {
				teachername:'',
				examinationTypeArray:['---请选择---','农业设施技术','马克思','人工智能','农村发展'],
				examinationTypeIndex:0,
				examinationTypeArrayType:'---请选择---',
				temperature:'',
				img:''
			}
		},
		methods:{
		  examinationType(e) {
		    this.examinationTypeIndex = e.target.value;
		    this.examinationTypeArrayType=this.examinationTypeArray[this.examinationTypeIndex]
		   },

			selectImg(e){
				console.log(e.tempFilePaths[0])
				this.img = e.tempFilePaths[0]
			},
			submit(){
				let that = this
				let date = fmtDate(Date.now())
				
				if (that.teachername == ''){
					wx.showToast({
						title:'请输入姓名',
						icon:'error'
					})
					return
				 }else if (that.examinationTypeArrayType == '---请选择---'){
				 	wx.showToast({
				 		title:'请选择课程',
				 		icon:'error'
				 	})
				 	return
				 }  
					// else if (that.examinationType == '---请选择---'){
					// wx.showToast({
					// 	title:'请选择课程',
					// 	icon:'error'
					// })
					// return
					 // }
				else if (that.img == ''){
					wx.showToast({
						title:'请上传照片',
						icon:'error'
					})
					return
				}
				uploadFile(that.img).then(res=>{
					 console.log(res);
					if (res.code != 200){
						wx.showToast({
							title:"图片上传失败"
						})
						return
					}
				})
				addTeacher(that.teachername,that.examinationTypeArrayType,that.temperature,that.img,date).then(res=>{
					console.log(that.img);
					console.log(res);
					
				if (res.data.code == 0){
						 wx.showToast({
							 title:"提交成功",
							 icon:'success'
						 })
					setTimeout(function(){wx.navigateBack({
													   delta:1
					   })
					},1000)
					}
				else{
							 wx.showToast({
							 		title:"提交失败",
							 		icon:'error'
							 })
							 return
						}
					 }
				)
				
			}
		}
	}
</script>

<style>
	page {
		background: #FFF;
	}
		
	.head {
		display: flex;
		background: rgb(27,130,207);
		font-size: 60rpx;
		height: 300rpx;
		padding: 1rpx 0;
	}
	
	.head .head-text{
		display: flex;
		width: 90%;
		background: rgba(160, 220, 255, .3);
		margin: 25rpx auto;
		height: 250rpx;
		line-height: 250rpx;
		text-align: center;
		align-items: center;
		justify-content: center;
		color: white;
	}
	
	.content-Box image{
		width: 150rpx;
	}
	
	.btn-Box {
		display: flex;
		flex-direction: row;	
		width: 90%;
		margin: 0 auto;
		justify-content: space-between;
	}
	
	.btnSubmit1 {
		width: 300rpx;
		height: 80rpx;
		background: rgb(25,152,255);
		color: white;
	}
	
	.btnSubmit2 {
		width: 250rpx;
		height: 80rpx;
		color: rgb(25,152,255);
		background: white;
	}
</style>