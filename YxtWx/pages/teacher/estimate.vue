<template>
	<view>
		<view>
			<uni-forms  >
				<uni-forms-item>
					<uni-easyinput v-model="formData" placeholder="请输入姓名" suffixIcon="search"  @iconClick="getReport"/>
				</uni-forms-item>
			</uni-forms>
			<uni-table ref="table" :loading="loading" border  emptyText="暂无更多数据" @selection-change="selectionChange">
				<uni-tr>
					<uni-th width="70" align="center">姓名</uni-th>
					<uni-th width="60" align="center">时间</uni-th>
					<uni-th width="50" align="center">打卡情况</uni-th>
				</uni-tr>
				<uni-tr v-for="(item, index) in list" :key="index">
					<uni-td align="center">{{ item.name }}</uni-td>
					<uni-td><view class="name">{{ item.time }}</view></uni-td>
					<uni-td align="center">{{ item.consquence }}</uni-td>
				</uni-tr>
			</uni-table>
			<view class="uni-pagination-box"><uni-pagination show-icon :page-size="pageSize" :current="pageCurrent" :total="total" @change="change" /></view>
		</view>
	</view>
</template>
<script>
	import { examine } from "@/api/dayUp.js"
	import { query } from "@/api/dayUp.js"
	export default {
		data() {
			return {
				formData:"",
				pageCurrent: 1,
				total: 0,
				loading: false,
				list: [],
				name:""
			}
		},
		onLoad() {
			let that = this
			examine().then(res => {
				console.log(res);
				that.list = res.data.result
				that.list.sort(function(b, a) {
				let obj1 = a['time']
				let obj2 = b['time']
				const val1 = Math.floor(new Date(obj1).getTime() / 1000)
				const val2 = Math.floor(new Date(obj2).getTime() / 1000)
				return val1 - val2
				// return val2 - val1
			  });
			})
			
			// v-for
				
			// <li>{{name}}  xuehao       {{if(i = 0;i<=list2.length;i++){if  namee
			// }}}             </li>
			 
			// const requestTask = uni.request({
			// 			url: 'https://zafuyxt.cn:8090/daka/selectDaka',
			// 			method: 'GET',
			// 			data: {
			// 				// id: 1,
			// 				《name: 'name',
			// 				time: 'time',
			// 				consquence: 'consquence',
			// 				number: 'number',
			// 			},

			// 			header: {
			// 				'content-type': 'application/json'
			// 			},
			// 			success: function(res) {
			// 				console.log(res);
			// 				that.list = res.data
			// 				// that.list.sort(function(b, a) {
			// 				//         let obj1 = a['time']
			// 				//         let obj2 = b['time']
			// 				//         const val1 = Math.floor(new Date(obj1).getTime() / 1000)
			// 				//         const val2 = Math.floor(new Date(obj2).getTime() / 1000)
			// 				//         return val1 - val2
			// 				//         // return val2 - val1
			// 				//       });
			// 									},
			// 			})
				},
				methods: {
					getReport(){
						 let that = this
						 // let name = this.formData.name
						 const nameselect = {
						 	name:this.formData
						 	
						 }
						 query(nameselect).then(res => {
						 	console.log(res);
						 	that.list = res.data.result
							that.list.sort(function(b, a) {
							        let obj1 = a['time']
							        let obj2 = b['time']
							        const val1 = Math.floor(new Date(obj1).getTime() / 1000)
							        const val2 = Math.floor(new Date(obj2).getTime() / 1000)
							        return val1 - val2
							        // return val2 - val1
							      });
						 })
					     // const indexReport = uni.request({
					     //     url: 'https://zafuyxt.cn:8090/daka/selectName',
					     //     method: 'POST',          
					     //     data: {
					     //        name:name
					     //           },
					     //     success: function(res) {
					     //     console.log(res.data);
					     //     that.list = res.data.result
							 // that.list.sort(function(b, a) {
							 //         let obj1 = a['time']
							 //         let obj2 = b['time']
							 //         const val1 = Math.floor(new Date(obj1).getTime() / 1000)
							 //         const val2 = Math.floor(new Date(obj2).getTime() / 1000)
							 //         return val1 - val2
							 //         // return val2 - val1
							 //       });
					     //  }
					     // });
					     },
	    	},
			}
</script>

<style lang="scss" scoped>
	.title {

		padding: 12px 2px;
		font-size: 12px;
		text-align: center;
		color: #ff0000
	}

	.view_fengexian {
		width: 96%;
		height: 50rpx;
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: center;
		margin: 0rpx 2% 0rpx 2%;
	}

	/* 两个view的样式 */
	.view_fengexian view {
		width: 33%;
		height: 2rpx;
		background: linear-gradient(to right, #ead6ee, #a0f1ea);
	}

	/* 字体的样式 */
	.text_fengexian {
		font-size: 25rpx;
		color: rgb(253, 143, 143);
		margin: 0rpx 2% 0rpx 2%;
	}
</style>
