<template>
	<view>
		<view>
		<view style="border:3rpx;border-color:lightblue;border-style:solid;">
<!-- 		<view class="uni-title uni-common-pl" style="background-color: transparent;text-align: center;opacity: 0.9;color:gray;">查询学生打卡情况</view>
		<view class="uni-title uni-common-pl" style="background-color: transparent;text-align: center;opacity: 0.9;color:gray;text-size-adjust:70% ;">{{getNowDate()}}</view> -->
		</view>
		<view style="border:3rpx;border-color:lightblue;border-style:solid;border-top: 0rem;">
			<view  class="uni-list-cell">
				<view>
					<button class="calendar-button1" type="button" @click="open" style="color: grey;"><uni-icons type="paperplane" color="lightblue"></uni-icons>选择日期</button>
				</view>
					<picker @change="bindPickerChange1" :value="index1" :range="namebox" range-key="stuname" >
					<button class="calendar-button1" type="button"  style="color: grey;"><uni-icons type="person" color="lightblue"></uni-icons>{{namebox[index1].stuname}}</button>
					</picker>
			</view>
			<view class="uni-list-cell" >
				<picker @change="bindPickerChange" :value="index" :range="array1" range-key="name" >
				<button class="calendar-button1" type="button"  style="color: grey;"><uni-icons type="bars" color="lightblue"></uni-icons>{{array1[index].name}}</button>
				</picker>
				
				<picker @change="bindPickerChange2" :value="index2" :range="array2" range-key="name" >
				<button class="calendar-button1" type="button" style="color: grey;"><uni-icons type="list" color="lightblue"></uni-icons>{{array2[index2].name}}</button>
				</picker>
				</view>
		</view>
		</view>
		<view class="table1" :style="{display:table1}" style="border:3rpx;border-color:lightblue;border-style:solid;border-top: 0rem;padding: 3%;box-shadow: 3px 3px 3px rgba(0,0,0,0.9)">
			<uni-table ref="table" :loading="loading" border emptyText="暂无更多数据" @selection-change="selectionChange" >
				<uni-tr >
					<uni-th width="50" align="center">姓名</uni-th>
					<uni-th width="50" align="center">打卡时间</uni-th>
					<!-- <uni-th width="70" align="center">打卡情况</uni-th> -->
				</uni-tr>
				<uni-tr v-for="(item, index) in list1" :key="index" >
					<uni-td align="center">{{ item.names }}</uni-td>
					<uni-td align="center">{{ item.time}}</uni-td>
					<!-- <uni-td align="center">{{ item.daka}}</uni-td> -->
				</uni-tr>
				</uni-table>
				</view>
		<view class="table2" :style="{display:table2}" style="border:3rpx;border-color:lightblue;border-style:solid;border-top: 0rem;padding: 3%;box-shadow: 3px 3px 3px rgba(0,0,0,0.9)">
			<uni-table ref="table" :loading="loading" border emptyText="暂无更多数据" @selection-change="selectionChange" >
				<uni-tr >
					<uni-th width="50" align="center">姓名</uni-th>
					<uni-th width="50" align="center">打卡次数</uni-th>
				</uni-tr>
				<uni-tr v-for="(item1, index) in list4" :key="index">
					<uni-td align="center">{{item1.names}}</uni-td>
					<uni-td align="center">{{item1.times}}次</uni-td>
				</uni-tr>
				</uni-table>
				</view>
				<uni-calendar ref="calendar" :clear-date="true" :date="info.date" :insert="info.insert" :lunar="info.lunar" :startDate="info.startDate"
				 :endDate="info.endDate" :range="info.range" @confirm="confirm" @close="close" />
	</view>
</template>
<script>
	import {
		examine
	} from "@/api/dayUp.js"
	import{request} from"@/utils/request.js"
	import{ifFirstLogin}from"@/api/login.js"
	import{timeFind}from"@/api/dayUp.js"
	const app = getApp()
	//查导师对应学生的接口
	import{findStudent} from"@/api/login.js"            
	export default {
		data() {
			const currentDate = this.getDate({
			            format: true
			        })
			return {
				table1:'',
				table2:'none',
				array1:[
					{name:'选择周次',
					 date1:'',
					 date2:'',
					 },
					{name:'第一周',
					 date1:'2023-02-20',
					 date2:'2023-02-26',
					 },
					{name:'第二周',
					 date1:'2023-02-27',
					 date2:'2023-03-05',
					 },
					 {name:'第三周',
					  date1:'2023-03-06',
					  date2:'2023-03-12',
					  },
					  {name:'第四周',
					   date1:'2023-03-13',
					   date2:'2023-03-19',
					   },
					   {name:'第五周',
					    date1:'2023-03-20',
					    date2:'2023-03-26',
					    },
						{name:'第六周',
						 date1:'2023-03-27',
						 date2:'2023-04-02',
						 },
						 {name:'第七周',
						  date1:'2023-04-03',
						  date2:'2023-04-09',
						  },
						  {name:'第八周',
						   date1:'2023-04-10',
						   date2:'2023-04-16',
						   },
						   {name:'第九周',
						    date1:'2023-04-17',
						    date2:'2023-04-23',
						    },
							{name:'第十周',
							 date1:'2023-04-24',
							 date2:'2023-04-30',
							 },
							 {name:'第十一周',
							  date1:'2023-05-01',
							  date2:'2023-05-07',
							  },
							  {name:'第十二周',
							   date1:'2023-05-08',
							   date2:'2023-05-14',
							   },
							   {name:'第十三周',
							    date1:'2023-05-15',
							    date2:'2023-05-21',
							    },
								{name:'第十四周',
								 date1:'2023-05-22',
								 date2:'2023-05-28',
								 },
								 {name:'第十五周',
								  date1:'2023-05-29',
								  date2:'2023-06-04',
								  },
								  {name:'第十六周',
								   date1:'2023-06-05',
								   date2:'2023-06-11',
								   }],          //周选择器
				array2:[
					{
						name:'选择月份',
						date1:'',
						date2:'',
					},
					{
						name:'一月',
						date1:'2023-01-01',
						date2:'2023-01-31',
					},
					{
						name:'二月',
						date1:'2023-02-01',
						date2:'2023-02-31',
					},
					{
						name:'三月',
						date1:'2023-03-01',
						date2:'2023-03-31',
					},
					{
						name:'四月',
						date1:'2023-04-01',
						date2:'2023-04-31',
					},
					{
						name:'五月',
						date1:'2023-05-01',
						date2:'2023-05-31',
					},
					{
						name:'六月',
						date1:'2023-06-01',
						date2:'2023-06-31',
					},
					{
						name:'七月',
						date1:'2023-07-01',
						date2:'2023-07-31',
					},
					{
						name:'八月',
						date1:'2023-08-01',
						date2:'2023-08-31',
					},
					{
						name:'九月',
						date1:'2023-09-01',
						date2:'2023-09-31',
					},
					{
						name:'十月',
						date1:'2023-10-01',
						date2:'2023-10-31',
					},
					{
						name:'十一月',
						date1:'2023-11-01',
						date2:'2023-11-31',
					},
					{
						name:'十二月',
						date1:'2023-12-01',
						date2:'2023-12-31',
					},
				],
					
				date1:'',       //日期起
				date2:'',       //日期止
				chooseName:'',  //选择的学生名
				index:0,
				index1:0,				
				index2:0,
				namebox:[{stuname:'所有学生',}],
				teachername:'',  //教师名
				formData: "",
				pageCurrent: 1,
				total: 0,
				loading: false,
				date: currentDate,
				list1:[{
					names:'',
					time:'',
					daka:'',			 
				 }],
				list2: [],
				list3:[{
					name:'',
                }],
				list4:[{
					names:'',
					times:'',		 
				 }],
			}
		},
		methods: {
			bindPickerChange(e) {                 //周次选择器
				let that = this
			    that.index=e.detail.value
				that.date1=that.array1[that.index].date1
				that.date2=that.array1[that.index].date2
				that.index2=0
				that.table1='none'
				that.table2=''
				console.log('选择了'+that.array1[that.index].name+'起止日期为'+that.date1+'到'+that.date2+'姓名为'+that.chooseName);
				this.timefind()
			},
			bindPickerChange1(e) {                //姓名选择器
				let that = this
				that.index1=e.detail.value
				that.chooseName=that.namebox[that.index1].stuname
				that.table1='none'
				that.table2=''
				console.log('选择了'+that.array1[that.index].name+'起止日期为'+that.date1+'到'+that.date2+'姓名为'+that.chooseName);
				if(that.index1==='0'){
					for(let i=0;i<that.list1.length;i++){
						that.list4[i]={
							names:that.list1[i].names,
							}
					}
				}else{
						that.list4=[{
							names:that.chooseName,
						}]
					}
					this.timefind()
			}
			
			,
			bindPickerChange2(e) {                //月份选择器
				let that = this
			    that.index2=e.detail.value
				that.date1=that.array2[that.index2].date1
				that.date2=that.array2[that.index2].date2
				that.index=0
				that.table1='none'
				that.table2=''
				console.log('选择了'+that.array2[that.index].name+'起止日期为'+that.date1+'到'+that.date2+'姓名为'+that.chooseName);
				this.timefind()
			},
			find() {
				let that = this
				examine(that.date).then(res => {
//					  console.log('日期:',that.date);
					that.list2 = res.data.result
//						console.log('本教师学生表list1:',that.list1);
//						console.log('打卡表list2:',that.list2);
					for (var i = 0; i < that.list1.length; i++) {
						that.list1[i].time ='无',
						that.list1[i].daka='否'
						for (var j = 0; j < that.list2.length; j++) {
							if (that.list1[i].names === that.list2[j].name) {
								that.list1[i].daka = '是',
								that.list1[i].time = that.list2[j].time
//								console.log('查询成功');
							}
						}
					}
				})
				for(let i=0;i<that.list1.length;i++){
					that.list4[i]={
						names:that.list1[i].names,
						times:0
						}
				}
			},
			 timefind(){
			 	let that = this
			 	timeFind(that.date1,that.date2).then(res => {
					for(let i=0;i<that.list4.length;i++){
						that.list4[i].times=0
						for(let j=0;j<res.data.result.length;j++){
							if(that.list4[i].names===res.data.result[j].name){
								that.list4[i].times+=1
							}
						}
					}
					that.list4.splice(0,0);
					console.log('这是res,',res);
			 	})
			 },             //按时间查询的方法
			 bindDateChange: function(e) {
			            this.date = e.detail.value
						this.find()
			        },
			  getDate(type) {
				  let that = this
			            const date = new Date();
			            let year = date.getFullYear();
			            let month = date.getMonth() + 1;
						that.index2=month
			            let day = date.getDate();
			
			            if (type === 'start') {
			                year = year - 60;
			            } else if (type === 'end') {
			                year = year + 2;
			            }
			            month = month > 9 ? month : '0' + month;
			            day = day > 9 ? day : '0' + day;
			            return `${year}-${month}-${day}`;
			        },
				    getNowDate() {
						let that = this
				      const timeOne = new Date()
				      const year = timeOne.getFullYear()
				      let month = timeOne.getMonth() + 1
				      let day = timeOne.getDate()
				      month = month < 10 ? '0' + month : month
				      day = day < 10 ? '0' + day : day
				      const NOW_MONTHS_AGO = `${year}年${month}月${day}日`
				      return NOW_MONTHS_AGO
				    },
							
							open() {
								this.$refs.calendar.open()
							},
							close(){
//								console.log('弹窗关闭');
							},
							confirm(e) {
								let that = this
//								console.log('confirm 返回:', e)
								that.date=e.fulldate
								this.find()
								that.index =0
								that.index1=0
								that.index2=0
								that.table1=''
								that.table2='none'
							},
			},
			computed: {
			        startDate() {
			            return this.getDate('start');
			        },
			        endDate() {
			            return this.getDate('end');
			        }
			    },
			onLoad() {
			let that = this
			// 查学生姓名
			//靠表格查询
			findStudent().then(res=>{
				//console.log('result:',res.data.result);
				for(var i = 0; i<res.data.result.length; i++){
					that.list1[i] = {
						names:res.data.result[i],
						// time:'无',
						// daka:'否'
					}
					that.namebox[i+1]={
						stuname:res.data.result[i]
					}
				}
			this.find()
//			console.log('namebox:',that.namebox);
			})
			ifFirstLogin().then(res=>{
//				console.log('教师名称:',res.data.userName);
				that.teachername=res.data.userName
			})
		}
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
	
	// .btn {
	// 	background-color: #2979ff;
	// 	color: white;
	// 	bottom: 5%;
	// 	width: 80%;
	// }
</style>
<style>
	.uni-list {
		background-color: #FFFFFF;
		position: relative;
		width: 100%;
		display: flex;
		flex-direction: column;
	}
	
	.uni-list-cell {
		position: relative;
		display:flex;
		flex-direction: row;
		justify-content: space-around;
		align-items: center;
	}
	
.uni-list-cell-db,
.uni-list-cell-right {
	flex: 1;
}
.uni-list-cell-left {
    white-space: nowrap;
	font-size:40rpx;
	padding: 0 30rpx;
}
.uni-triplex-left .uni-title{
	padding:8rpx 0;
}
.uni-common-pl{
	padding-left:30rpx;
}
.example-body {
		/* #ifndef APP-NVUE */
		display: flex;
		/* #endif */
		flex-direction: row;
	}
	.calendar-button1 {
		flex: 1;
		font-weight: bold;
		font-size: 32rpx;
	 	 margin-left:20rpx; 
		margin-bottom: 20rpx;
		width: 300rpx;
	}
</style>
