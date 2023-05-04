<template>
<view class="example">
	<uni-section title="请输入论文题目" type="line" padding>
		<picker @change="examinationType" :range="examinationTypeArray">
			<uni-forms-item  required>
			<label class="">{{ examinationTypeArrayType }}</label>
			</uni-forms-item>
		</picker>
		<uni-easyinput class="uni-mt-5" trim="all" v-model="value1" placeholder="请输入题目" @input="input1"></uni-easyinput>
		<uni-easyinput class="uni-mt-5" trim="all" v-model="value2" placeholder="请输入姓名" @input="input2"></uni-easyinput>
	</uni-section>
<uni-section title="论文审核周期,注意事项,个人总结等" type="line">
  <uni-forms>
	<uni-forms-item>
		<uni-easyinput  type="textarea" v-model="content" placeholder="请输入内容"/>
	</uni-forms-item>
  </uni-forms>
</uni-section>
<uni-section>
<button class="btn" @tap="submit">提交</button>
</uni-section>
</view>
</template>
<script>
	import{ submitin } from '@/api/submit.js'
	export default {
		data() {
			return {
				value1:"",
				value2:"",
				content: "",
				examinationTypeArray:['---请选择---','sci','发明专利','核心'],
				examinationTypeArrayType:'---请选择成果类型---',
				publishRules: {
					content: {
						rules:[
							{ required: true, errorMessage: '该项不能为空' }
						]
					}
				}
			}
		},
		methods:{
			examinationType(e) {
			  this.examinationTypeIndex = e.target.value;
			  this.examinationTypeArrayType=this.examinationTypeArray[this.examinationTypeIndex]
			 },
			submit(){
				 let that = this
				 const Submittxt = {
				 					 type:this.examinationTypeArray[this.examinationTypeIndex],
				 					 contents:this.content,
				 					 fromname:this.value1,
				 					 name:this.value2,
				 }
				 if (that.value2 == ''){
				 	wx.showToast({
				 		title:'请输入姓名',
				 		icon:'error'
				 	})
				 	return
				  }else if(that.examinationTypeArrayType== '---请选择---'){
					 wx.showToast({
					 	title:'请输入成果类型',
					 	icon:'error'
					 })
					 return 
				  }else if(that.value1 == ''){
					 wx.showToast({
					 	title:'请输入题目',
					 	icon:'error'
					 })
					 }else if(that.content== ''){
					 wx.showToast({
					 	title:'请输入内容',
					 	icon:'error'
					 })
					 }
				 submitin(Submittxt).then(res=>{
					  console.log(Submittxt)
					 wx.showToast({
						title:'提交成功',
						duration:1500
					 })
				 })
				 },
				 input1(e) {
							console.log('输入内容：', e);
						  },
				 input2(e) {
							console.log('输入内容：', e);
							},
		}
	}
</script>

<style>
	.example {
		padding: 5%;
		background-color: #fff;
		height: 100%;
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