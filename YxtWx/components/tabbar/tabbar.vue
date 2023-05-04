 
 
<template>
    <block>
        <view v-for="(item,index) in tabList" :key="index" class="navigator"
            :class="currentTabIndex == index ? 'on' : ''" @click="switchTab1(index)">
            <view class="icon">
                <text class="iconfont" :class="item.icon"
                    :style="[currentTabIndex == index ? {'color': tintColor} : {'color': color}]"></text>
                <text v-if="item.badgeDot" class="uni_badge uni_badge_dot"></text>
            </view>
            <view class="text" :style="[currentTabIndex == index ? {'color': tintColor} : {'color': color}]">
                {{item.text}}</view>
        </view>
    </block>
 
</template>

<script>
	export default {
		data() {
			return {
               //需要跳转的路径和text
				tabList: [{
						page: '../../pages/teachers/teachers',
						text: '首页',
					},
					{
						page: '../../pages/wode/wode',
						text: '我的',
					}
				],
				currentTabIndex: this.current
			}
		},
		props: {
			current: {
				type: [Number, String],
				default: 0
			},
			backgroundColor: {
				type: String,
				default: '#fbfbfb'
			},
           //默认tabbar文字颜色
			color: {
				type: String,
				default: '#999'
			},
           //点击tabbar文字颜色
			tintColor: {
				type: String,
				default: '#42b983'
			}
		},
		methods: {
          //点击事件 ，点击text跳转相对应的路径
			switchTab1(index) {
				this.currentTabIndex = index
				this.$emit('click', index)
				uni.redirectTo({
					url: this.tabList[index].page
				})
 
			}
		},
	}
</script>

<style>

</style>
