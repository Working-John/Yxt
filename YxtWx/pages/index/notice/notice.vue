<template>
	<view class="communication-box">
		<view style="margin-top: 10rpx;flex: 1;overflow: scroll;">
			<scroll-view scroll-y="true">
				<view v-for="(item, index) in communicationInfo" :key="index" @click="goCommunicationDetail(item)">
					<uni-card :title="item.tittle" :sub-title="item.admin" :extra="item.publishTime" thumbnail="/static/images/board.png">
						<uni-tag :inverted="true" :text="item.type" type="primary"/>
					</uni-card>
				</view>
				<view style="height: 150rpx;"></view>
			</scroll-view>
		</view>
	</view>
</template>

<script>
	import { getAllCommunication, getAllVote, getAlltQuestionnaire } from "@/api/communication.js"
	import { fmtDate } from '@/utils/formatTime.js'
	export default {
		onLoad(e) {
			
		},
		onShow() {
			getAllCommunication().then(res=>{
				this.communicationInfo = res.data.result.filter(item => item.type == '首页公告')
				console.log('首页公告',this.communicationInfo);
				for (let item of this.communicationInfo) {
					item.publishTime = fmtDate(item.publishTime)
				}
			})
		},
		data() {
			return {
				communicationInfo: [],
				noticeImg: '',
				trophiesImg: '',
				voteInfo: [],
				questionnaireInfo: []
			}
		},
		methods:{
			goCommunicationDetail(item) {
				wx.navigateTo({
					url: '../../communication/communicationDetail/communicationDetail?item=' + JSON.stringify(item)
				})
			}
		}
	}
</script>

<style>
	.communication-box {
		display: flex;
		flex-direction: column;
		height: 100%;
	}
	
	.uni-body {
		display: block;
		overflow: hidden;
		white-space: nowrap;
		-o-text-overflow: ellipsis;
		text-overflow: ellipsis;
	}
	
	.btn {
		background-color: #2979ff;
		color: white;
		position: fixed;
		bottom: 0;
		width: 100%;
		border-radius: 0;
	}
	
	.pub-title {
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 2;
		word-break: break-all;
		margin-left: 20rpx;
	}
	
	.text-pub {
		display: flex;
		flex-direction: column;
	}
	
	.left-text {
		display: flex;
		flex-direction: row;
		align-items: center;
	}

</style>