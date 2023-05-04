<template>
    <view>
		<uni-section>
			<view class="flexbox-row" v-for="item in tableList1" :key="item">{{item.fromname}}</view>
					<view class="example-body">
						<view class="uni-box">
							<uni-title class="h3" type="h3" title="类型"></uni-title>
						</view>
						<view>
						<text class="uni-text" v-for="item in tableList1" :key="item">{{item.type}}</text>
						</view>
						<view class="uni-box">
							<uni-title class="h3" type="h3" title="姓名"></uni-title>
						</view>
						<view>
						<text class="uni-text" v-for="item in tableList1" :key="item">{{item.name}}</text>
						</view>
						<view class="uni-box">
							<uni-title class="h3" type="h3" title="内容"></uni-title>
						</view>
						<view>
						<text class="uni-text" v-for="item in tableList1" :key="item">{{item.contents}}</text>
						</view>
					</view>
					<view class="close" >
						<button type="warn" @click="closeDrawer1()"><text class="word-btn-white">删除经验</text></button>
					</view>
				</uni-section>
    </view>
</template>
<script>
	import { submitsearch } from'@/api/submit.js'
	import { deletesubmit } from'@/api/submit.js'
	import { ifFirstLogin }from"@/api/login.js"
    export default {
		onLoad(e){
			this.Primary = e.Primary || '';
			let that = this
			submitsearch().then(res=>{
				console.log(res)
				for(let i = 0;i<res.data.result.length;i++)
				{
					if(res.data.result[i].fromname === that.Primary){
						that.tableList1.push(res.data.result[i])
					}
				// this.tableList1[i]={
				// 	id:i,
				// 	name:res.data.result[i].name,
				// 	type:res.data.result[i].type,
				// 	fromname:res.data.result[i].fromname,
				// 	contents:res.data.result[i].contents,
				// }
				// this.tableList2 = this.tableList1
				}
			    console.log(that.tableList1)
			})
			ifFirstLogin().then(res=>{
				console.log('姓名:',res.data.userName);
				that.usename=res.data.userName
			})
		},
        data() {
            return {
				Primary:'',
				showRight: false,
                tableList1: [],
				tableList2: [{
						id:"",
						name: "",
						type: "",
						fromname: "",
						contents: ""
							}],
						contentess:"",
						fromnames:"",
						deletename:"",
						usename:""
                   };
        },
        methods:{
			closeDrawer1() {
				let that = this
				const contentsss = {
					fromname:that.tableList1.name
				}
				if(that.usename === that.tableList1[0].name){
				deletesubmit(contentsss).then(res=>{
				wx.showToast({
					title:'删除成功',
					duration:1500
				})
				})
				}else{
				wx.showToast({
					title:'删除失败',
					duration:1500
				})
				}
			}
        }
    };
</script>

<style lang="scss" scoped>
.title {
	                // width: 100px;
	                padding: 12px 2px;
	                font-size: 12px;
	                text-align: center;
					color: #ff0000
	    }
.scroll-view {
					/* #ifndef APP-NVUE */
					width: 100%;
					height: 100%;
					/* #endif */
					flex: 1
        }
.scroll-view-box {
					flex: 1;
					position: absolute;
					top: 0;
					right: 0;
					bottom: 0;
					left: 0;
        }
.info {
			padding: 15px;
			color: #666;
		}
		
.info-text {
			font-size: 14px;
			color: #666;
		}
		
.info-content {
			padding: 5px 15px;
		}
		
.close {
			padding: 10px;
		}
.btn    {
					background-color: #55ffff;
					color: black;
					bottom: 20%;
					width: 100%;
        }
.example-body {
	                padding: 10px;
               }
.flexbox-row {
			display: flex;
			flex-direction: row; /* default value */
			justify-content: center; /* x-axis */
			align-items: center; /* y-axis */
			font-size:20px
}

// .class-table {
// .tabel-container {
//         margin: 7px;
//         table{
//             table-layout: fixed;
//             width: 100%;
//         thead{
//             background-color: #67a1ff;
//             th{
//                     color: #fff;
//                     line-height: 17px;
//                     font-weight: normal;
//               }
//             }
//         tbody{
//             background-color: #eaf2ff;
//             td {
//                     color: #677998;
//                     line-height: 12px;
//                }
//             }
//             th,
//         td {
//                 width: 60px;
//                 padding: 12px 2px;
//                 font-size: 12px;
//                 text-align: center;
//             }

//         tr td:first-child {
//                 color: #333;
//                 .period {
//                     font-size: 8px;
//                 }
//             }
//         }
//     }
// }
// .class-table2{
// 	display:flex;

// 	}
</style>


	