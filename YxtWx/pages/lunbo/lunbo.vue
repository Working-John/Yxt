<template>
	<view class="container">
		<uni-section title="农林资讯" type="line">
			<uni-card :cover="cover" @click="onClick">
				<!-- <image slot='cover' style="width: 100%;" :src="cover"></image> -->
				<text class="uni-body">浙江农林大学数学与计算机科学学院</text>
				<view slot="actions" class="card-actions">
				<!-- 	<view class="card-actions-item" @click="actionsClick('分享')">
						<uni-icons type="pengyouquan" size="25" color="#999"></uni-icons>
						<text class="card-actions-item-text">分享</text>
					</view> -->
					<view class="card-actions-item" @click="actionsClick('点赞')">
						<uni-icons type="heart" size="30" color="#999"></uni-icons>
						<text class="card-actions-item-text">点赞</text>
					</view>
					<view class="card-actions-item" @click="actionsClick('评论')">
						<uni-icons type="chatbubble" size="30" color="#999"></uni-icons>
						<text class="card-actions-item-text">评论</text>
					</view>
				</view>
			</uni-card>
		</uni-section>

		<uni-section title="农林资讯1" type="line">
			<uni-card title="基础卡片" sub-title="副标题" extra="额外信息" padding="10px 0" :thumbnail="avatar" >
				<template v-slot:title>
					<uni-list>
						<uni-list-item :show-switch="true" title="自定义标题"/>
					</uni-list>
				</template>
				<image style="width: 100%;" :src="cover"></image>
				<text class="uni-body uni-mt-5">浙江农林大学数学与计算机科学学院</text>
				<view slot="actions" class="card-actions">
					<!-- <view class="card-actions-item" @click="actionsClick('分享')">
						<uni-icons type="pengyouquan" size="25" color="#999"></uni-icons>
						<text class="card-actions-item-text">分享</text>
					</view> -->
					<view class="card-actions-item" @click="actionsClick('点赞')">
						<uni-icons type="heart" size="30" color="#999"></uni-icons>
						<text class="card-actions-item-text">点赞</text>
					</view>
					<view class="card-actions-item" @click="actionsClick('评论')">
						<uni-icons type="chatbubble" size="30" color="#999"></uni-icons>
						<text class="card-actions-item-text">评论</text>
					</view>
				</view>
			</uni-card>
		</uni-section>

		<uni-section title="农林资讯2" type="line">
			<uni-card padding="0" spacing="0">
				<template v-slot:cover>
					<view class="custom-cover">
						<image class="cover-image" mode="aspectFill" :src="cover">
						</image>
						<view class="cover-content">
							<text class="uni-subtitle uni-white">今日新闻热点</text>
						</view>
					</view>
				</template>
				<uni-list>
					<uni-list-item title="今日新闻" showArrow></uni-list-item>
					<uni-list-item title="今日新闻" showArrow></uni-list-item>
				</uni-list>
				<view slot="actions" class="card-actions no-border">
					<!-- <view class="card-actions-item" @click="actionsClick('分享')">
						<uni-icons type="pengyouquan" size="default" color="#999"></uni-icons>
						<text class="card-actions-item-text">分享</text>
					</view> -->
					<view class="card-actions-item" @click="actionsClick('点赞')">
						<uni-icons type="heart" size="30" color="#999"></uni-icons>
						<text class="card-actions-item-text">点赞</text>
					</view>
					<view class="card-actions-item" @click="actionsClick('评论')">
						<uni-icons type="chatbubble" size="30" color="#999"></uni-icons>
						<text class="card-actions-item-text">评论</text>
					</view>
				</view>
			</uni-card>
		</uni-section>


	</view>
</template>


<script>
	export default {
		components: {},
		data() {
			return {
				cover: 'https://www.zafu.edu.cn/__local/C/A9/BC/0B6B9D2EEA90616773713D4F174_73F82E76_2F2F5.jpg',
				extraIcon:{
					color: '#4cd964',
					size: '22',
					type: 'gear-filled'
				}
			}
		},
		methods: {
			onClick(e){
				console.log(e)
			},
			actionsClick(text){
				uni.showToast({
					title:text,
					icon:'none'
				})
			}
		}
	}
</script>

<style lang="scss">
</style>