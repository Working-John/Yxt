<template>
	<view>
		

			<uni-tr>
				<uni-th width="60" align="center">姓名</uni-th>
				<uni-th width="60" align="center">打卡次数</uni-th>
				<uni-th width="60" align="center">日报次数</uni-th>
				<uni-th width="auto" align="center">评分</uni-th>
			</uni-tr>
			<uni-tr v-for="(item,index) in list1" :key="index">
				<uni-td align="center"><text style="font-size:30rpx;">{{item.names}}</text></uni-td>
				<uni-td align="center">{{item.times1}}</uni-td>
				<uni-td align="center">{{item.times2}}</uni-td>
				<uni-td align="center"><uni-rate></uni-rate></uni-td>
			</uni-tr>
		</view>
</template>

<script>
	import {examine} from "@/api/dayUp.js"
	import{request} from"@/utils/request.js"
	import{ifFirstLogin}from"@/api/login.js"
	const app = getApp()
	import{findStudent} from"@/api/login.js"   
	export default{
		data(){
			return{
				list1:[{
					names:'',        //名
					times1:'Null',      //总打卡数
					times2:'Null',		//总日报数
					status:'',     //星级
				}],   
			}
		},
		onLoad(){
			let that = this
			findStudent().then(res=>{
				console.log(res);
				for(var i = 0; i<res.data.result.length; i++){
					that.list1[i] = {
						names:res.data.result[i],
						times1:'Null',
						times2:'Null',
						
					}
				}
				console.log('list1:',that.list1);
			})
		},
		onShow(){},
		
		methods:{
			
		},
	}
</script>

<style>
</style>