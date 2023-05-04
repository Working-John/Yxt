<template>
	<view class="container">
		<view class="head">
			总积分:{{totalScore}}
		</view>
		<view class="body">
			<view class="item" v-for="(item,index) in historyList">
				<view class="content">
					<view class="type">
						{{item.type}}
					</view>
					<view class="date">
						{{item.updateTime}}
					</view>
				</view>
				<view class="score">
					+{{item.changeScore}}
				</view>
				
			</view>
		</view>
	</view>
</template>

<script>
	// const {
	// 	getMyIntegral,
	// 	getMyHistory
	// } = require('@/api/integral.js')
	export default {
		data() {
			return {
				totalScore:0,
				historyList:[]
			}
		},
		onLoad() {
			getMyIntegral().then(res => {
				console.log(res);
				if (res.data.code == 200){
					this.totalScore = res.data.result.total
				}
			})
			getMyHistory().then(res => {
				console.log(res);
				if (res.data.code == 200){
					this.historyList = res.data.result.reverse()
				}
			})
		},
		methods: {
			
		}
	}
</script>

<style>
.container {
	height: 100%;
	background: rgb(243,245,249);
}
.head {
	height: 400rpx;
	background: deepskyblue;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	font-size: 50rpx;
}

.body {
	display: flex;
	flex-direction: column;
	margin: 0 auto;
	margin-top: -50rpx;
	border-radius: 30rpx;
	background: #fff;
	width: 80%;
}

.item {
	display: flex;
	flex-direction: row;
	height: 120rpx;
	align-items: center;
	background: #fff;
	margin-top: 20rpx;
	border-bottom: 1rpx solid darkgrey;
}
.content {
	display: flex;
	flex-direction: column;
	width: 400rpx;
	margin-left: 30rpx;
}

.type {
	font-size: 40rpx;
}

.date {
	color:grey
}

.score {
	margin-left: 30rpx;
	color: red;
	font-size: 46rpx;
}

</style>
