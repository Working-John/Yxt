<template>
	<!-- pages/course/course.wxml -->
	<!-- <button>计科一班课程表</button> -->
	<view class="courseContainer">
		<!-- 导航区域 -->
		<scroll-view class="navScroll" scroll-x enable-flex
			:scroll-into-view="'t' + (nowWeek ? nowWeek - 3 : pageNum > 3 ? pageNum - 2 : '0')" scroll-with-animation>
			<view class="navItem" :id="'t' + index" v-for="(item, index) in weekArray" :key="index">
				<view :class="'navContent ' + (todayWeek == index + 1 || index == pageNum ? 'active' : '')"
					@tap="changeNav" :data-page="index">
					{{ todayWeek == index + 1 ? item + '(本周)' : item }}
				</view>
			</view>
		</scroll-view>

		<!-- 日期区域 -->
		<view class="date">
			<view class="month">
				<view>{{ month }}</view>
				<view>月</view>
			</view>
			<view class="day">
				<view :class="'week ' + (todayMonth == monthNum && day == item ? 'todayDate' : '')"
					v-for="(item, index) in nowDay" :key="index">
					<view class="week-item">周{{ week[index] }}</view>

					<view class="day-item">
						{{ nowDay[index] == 1 ? (monthNum < 12 ? monthNum + 1 : 1) + '月' : nowDay[index] + '日' }}</view>
				</view>
			</view>
		</view>

		<!-- 课表区域 -->
		<swiper style="height: 1200rpx;" :current="nowWeek - 1" @change="(e)=>changeNav2(e)">
			<swiper-item v-for="(item,index) in weekArray" :key="index">
				<view class="swiper-item">
					<scroll-view :scroll-x="false" scroll-y :scroll-top="scrollTop" class="courseScroll">
						<view class="courseContent">
							<view class="courseTime">
								<view class="left" v-for="(item, index) in 12" :key="index">
									<view class="number">{{ item + 1 }}</view>
					
									<view class="course-time">
										<view class="time-start">{{ course_time[index]['0'] }}</view>
										<view class="time-end">{{ course_time[index][1] }}</view>
									</view>
								</view>
								<view>
									<view>其他课程</view>
								</view>
							</view>
							<view class="course">
								<view class="kcb-item" :style="
					                    'margin-left:' +
					                    (item.isToday-1) * 100  +
					                    'rpx;margin-top:' +
					                    ((item.jie - 1) * 110 + 4) +
					                    'rpx;height:' +
					                    (item.classNumber * 110 - 8) +
					                    'rpx;'
					                " v-for="(item, index_kcb) in wList[index]" :key="index_kcb">
									<view class="smalltext" :style="'background-color:' + colorArrays[item.id - 1]">
										<view class="smalltextName">{{ item.name }}</view>
										<view class="smalltextAddress">{{ item.address }}</view>
									</view>
								</view>
					
								<!-- <view wx:for="{{otherCourse}}" wx:key="index" class="otherCourse">
					  <view>{{item.name}}*{{item.teacher}}/{{item.time}}/{{item.address}}</view>
					</view> -->
							</view>
						</view>
					</scroll-view>
				</view>
			</swiper-item>
			<!-- <swiper-item>
				<view class="swiper-item"></view>
			</swiper-item> -->
		</swiper>
	</view>
</template>

<script>
	// var colors = require('../../utils/colors.js');
	var colors = ['#AEEC34', '#FFC44F', '#85B0FD', '#FEA17C', '#FF9392', '#D48DF9', '#7FCFF8', '#85B8CF', '#90C652',
		'#D8AA5A', '#FC9F9D', '#0A9A84', '#61BC69', '#12AEF3', '#E29AAD'
	];
	const app = getApp();
	export default {
		data() {
			return {
				weekArray: [
					'第1周',
					'第2周',
					'第3周',
					'第4周',
					'第5周',
					'第6周',
					'第7周',
					'第8周',
					'第9周',
					'第10周',
					'第11周',
					'第12周',
					'第13周',
					'第14周',
					'第15周',
					'第16周',
					'第17周',
					'第18周',
					'第19周',
					'第20周',
					'第21周'
				],
				pageNum: 0,

				// 当前所在分类的索引
				todayDay: '',

				// 今日日期
				todayMonth: '',

				// 今日月份
				todayWeek: '',

				// 今日周
				day: '',

				// 日期
				month: '',

				// 月份
				monthNum: 1,

				week: [ '一', '二', '三', '四', '五', '六','日'],

				// 周一为起始日
				nowDay: [1, 2, 3, 4, 5, 6, 7],

				// 本周的七天日期
				schoolTime: ['2023', '01', '2'],

				// 本学期开学时间，为一周的第一天
				nowWeek: '',

				// 当前周
				course_time: [
					['8:40', ''],
					['', '10:00'],
					['10:30', ''],
					['', '11:50'],
					['14:00', ''],
					['', '15:20'],
					['15:50', ''],
					['', '17:10'],
					['18:30', ''],
					['', '19:50'],
					['20:00', ''],
					['', '21:20']
				],

				wList: [
					[
						//第一周
						{
							id: 1,
							isToday: 1,
							jie: 7,
							classNumber: 2,
							name: '算法设计与分析第一周',
							address: '2306'
						},
						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 7,
							isToday: 2,
							jie: 7,
							classNumber: 2,
							name: '数学建模',
							address: '1215'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '计算机网络',
							address: '2304'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第二

						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统第二周',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 7,
							isToday: 2,
							jie: 7,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '2306'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第三周
						{
							id: 1,
							isToday: 1,
							jie: 7,
							classNumber: 2,
							name: '算法设计与分析',
							address: '2306'
						},
						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 7,
							isToday: 2,
							jie: 7,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '计算机网络',
							address: '2304'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第四

						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 7,
							isToday: 2,
							jie: 7,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '2306'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第5周
						{
							id: 1,
							isToday: 1,
							jie: 7,
							classNumber: 2,
							name: '算法设计与分析',
							address: '2306'
						},
						{
							id: 7,
							isToday: 3,
							jie: 1,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '计算机网络',
							address: '2304'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第6

						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 7,
							isToday: 3,
							jie: 1,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '2306'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第7周
						{
							id: 1,
							isToday: 1,
							jie: 7,
							classNumber: 2,
							name: '算法设计与分析',
							address: '2306'
						},
						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 7,
							isToday: 3,
							jie: 1,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '计算机网络',
							address: '2304'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第8

						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 7,
							isToday: 3,
							jie: 1,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '2306'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第9周
						{
							id: 1,
							isToday: 1,
							jie: 7,
							classNumber: 2,
							name: '算法设计与分析',
							address: '2306'
						},
						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 7,
							isToday: 5,
							jie: 1,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '计算机网络',
							address: '2304'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第10

						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 7,
							isToday: 5,
							jie: 1,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '2306'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第11周
						{
							id: 1,
							isToday: 1,
							jie: 7,
							classNumber: 2,
							name: '算法设计与分析',
							address: '2306'
						},
						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 7,
							isToday: 5,
							jie: 1,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '计算机网络',
							address: '2304'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第12

						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 7,
							isToday: 5,
							jie: 1,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '2306'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第13周
						{
							id: 1,
							isToday: 1,
							jie: 7,
							classNumber: 2,
							name: '算法设计与分析',
							address: '2306'
						},
						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 7,
							isToday: 3,
							jie: 5,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '计算机网络',
							address: '2304'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第14

						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 7,
							isToday: 3,
							jie: 5,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '2306'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第15周
						{
							id: 1,
							isToday: 1,
							jie: 7,
							classNumber: 2,
							name: '算法设计与分析',
							address: '2306'
						},
						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 7,
							isToday: 3,
							jie: 5,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '计算机网络',
							address: '2304'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第16

						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 7,
							isToday: 3,
							jie: 5,
							classNumber: 2,
							name: '数学建模',
							address: '未知'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '2306'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第一周
						{
							id: 1,
							isToday: 1,
							jie: 7,
							classNumber: 2,
							name: '算法设计与分析',
							address: '2306'
						},
						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '计算机网络',
							address: '2304'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第二

						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '2306'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第一周
						{
							id: 1,
							isToday: 1,
							jie: 7,
							classNumber: 2,
							name: '算法设计与分析',
							address: '2306'
						},
						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '计算机网络',
							address: '2304'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第二

						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '2306'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第一周
						{
							id: 1,
							isToday: 1,
							jie: 7,
							classNumber: 2,
							name: '算法设计与分析',
							address: '2306'
						},
						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '计算机网络',
							address: '2304'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					],
					[
						//第二

						{
							id: 2,
							isToday: 1,
							jie: 1,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 1,
							jie: 3,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 4,
							isToday: 2,
							jie: 3,
							classNumber: 2,
							name: 'Matlab',
							address: '2306'
						},
						{
							id: 5,
							isToday: 2,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '1104'
						},
						{
							id: 6,
							isToday: 3,
							jie: 3,
							classNumber: 2,
							name: '计算机网络',
							address: '5102'
						},
						{
							id: 2,
							isToday: 3,
							jie: 7,
							classNumber: 2,
							name: '操作系统',
							address: '5409'
						},
						{
							id: 3,
							isToday: 4,
							jie: 1,
							classNumber: 2,
							name: '毛概',
							address: '6202'
						},
						{
							id: 6,
							isToday: 4,
							jie: 5,
							classNumber: 2,
							name: '数据库原理及应用',
							address: '2306'
						},
						{
							id: 1,
							isToday: 5,
							jie: 3,
							classNumber: 2,
							name: '算法设计与分析',
							address: '5506'
						}
					]
					// otherCourse:[{"id":1,"name":"应用软件开发课程设计","time":"18-19周","address":"无","teacher":"沈华"},]
				],

				colorArrays: '',
				scrollTop: 0
			};
		}
		/**
		 * 生命周期函数--监听页面加载
		 */
		,
		onLoad: function(options) {
			let nowWeek = this.getNowWeek();
			let nowDay = this.getDayOfWeek(nowWeek);
			let pageNum = nowWeek - 1;
			let month = this.getMonth((nowWeek - 1) * 7);
			this.todayMonth;
			
			this.nowWeek = nowWeek,
			this.nowDay = nowDay,
			this.pageNum = pageNum,
			this.todayWeek = nowWeek,
			this.monthNum = month / 1,
			// 当前月份数字类型，用于数字运算
			this.colorArrays = colors // 课表颜色
		},
		/**
		 * 生命周期函数--监听页面初次渲染完成
		 */
		onReady: function() {
			this.todayDay = new Date().getDate(),
			this.todayMonth = new Date().getMonth() + 1,
			this.day = new Date().getDate(),
			this.month = new Date().getMonth() + 1
		},
		/**
		 * 生命周期函数--监听页面显示
		 */
		onShow: function() {},
		/**
		 * 生命周期函数--监听页面隐藏
		 */
		onHide: function() {},
		/**
		 * 生命周期函数--监听页面卸载
		 */
		onUnload: function() {},
		/**
		 * 页面相关事件处理函数--监听用户下拉动作
		 */
		onPullDownRefresh: function() {},
		/**
		 * 页面上拉触底事件的处理函数
		 */
		onReachBottom: function() {},
		/**
		 * 用户点击右上角分享
		 */
		onShareAppMessage: function() {},
		methods: {
			// 获取第几周后的月份
			getMonth(days) {
				let [year, month, day] = this.schoolTime;
				var date = new Date(year, month - 1, day);
				date.setDate(date.getDate() + days); //获取n天后的日期
				var m = date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1;
				return m;
			},

			// 获取第几周后的星期几的日期
			getDay(days) {
				let [year, month, day] = this.schoolTime;
				var date = new Date(year, month - 1, day);
				date.setDate(date.getDate() + days); //获取n天后的日期
				var d = date.getDate() < 10 ? '0' + date.getDate() : date.getDate(); //获取当前几号，不足10补0
				return d;
			},

			// 获取当前周
			getNowWeek() {
				var date = new Date();
				let [year, month, day] = this.schoolTime;
				var start = new Date(year, month - 1, day);
				//计算时间差
				var left_time = parseInt((date.getTime() - start.getTime()) / 1000) + 24 * 60 * 60;
				var days = parseInt(left_time / 3600 / 24);
				var week = Math.floor(days / 7) + 1;
				var result = week;
				// if (week > 20 || week <= 0) {
				// 	result = this.now_week;
				// }
				return result;
			},

			//获取一周的日期
			getDayOfWeek(week) {
				var day = [];
				for (var i = 0; i < 7; i++) {
					var days = (week - 1) * 7 + i;
					day.push(this.getDay(days));
				}
				return day;
			},

			// 获取课表数据
			async getCourseList() {},

			// 点击切换导航的回调
			changeNav(event) {
				let pageNum = event.currentTarget.dataset.page;
				let nowWeek = pageNum + 1;
				let nowDay = this.getDayOfWeek(nowWeek);
				let month = this.getMonth((nowWeek - 1) * 7);
				this.pageNum = pageNum,
				this.nowWeek = nowWeek,
				this.nowDay = nowDay,
				this.month = month,
				this.monthNum = month / 1 // 当前月份数字类型，用于数字运算
			},
			changeNav2(event) {
				let pageNum = event.detail.current;
				let nowWeek = pageNum + 1;
				let nowDay = this.getDayOfWeek(nowWeek);
				let month = this.getMonth((nowWeek - 1) * 7);
				this.pageNum = pageNum,
				this.nowWeek = nowWeek,
				this.nowDay = nowDay,
				this.month = month,
				this.monthNum = month / 1 // 当前月份数字类型，用于数字运算
			}
		}
	};
</script>
<style>
	.navScroll {
		display: flex;
		white-space: nowrap;
		height: 75rpx;
		font-size: 25rpx;
	}

	.navScroll .navItem {
		margin: 20rpx 12rpx 0rpx;
	}

	.navScroll .navItem .navContent {
		padding: 5rpx 25rpx;
		line-height: 38rpx;
	}

	.active {
		border-bottom: 1px solid red;
		color: red;
	}

	.date {
		display: flex;
		height: 90rpx;
		padding: 6rpx 0;
		color: #3f3f3f;
		line-height: 1.4;
	}

	.date .month {
		width: 7%;
		font-size: 24rpx;
		display: inline-block;
		color: #3f3f3f;
		text-align: center;
		height: 100%;
		padding: 8rpx 0;
	}

	.date .day {
		width: calc(100% - 8%);
		margin: 0 auto;
	}

	.date .day .week {
		width: calc(100% / 7);
		display: inline-block;
		height: 100%;
		text-align: center;
	}

	.date .day .week-item {
		font-size: 24rpx;
		font-weight: 700;
		line-height: 1.8;
	}

	.date .day .day-item {
		font-size: 22rpx;
		color: #333;
	}

	.date .day .todayDate {
		background: #1380ff;
		border-radius: 8rpx;
		color: #fff;
	}

	.date .day .todayDate .day-item {
		color: #fff;
	}

	.courseScroll {
		width: 100%;
		height: 100%;
		z-index: 2;
		position: fixed;
	}

	.courseScroll .courseContent {
		height: 1580rpx;
		width: 100%;
		display: flex;
	}

	.courseScroll .courseContent .courseTime {
		width: 7%;
		font-size: 24rpx;
		display: inline-block;
		color: #3f3f3f;
		text-align: center;
	}

	.courseScroll .courseContent .courseTime .left {
		width: 100%;
		height: 110rpx;
		justify-content: center;
		display: flex;
		position: relative;
		align-items: center;
		z-index: 0;
		flex-direction: column;
	}

	.courseScroll .courseContent .courseTime .left .course-time {
		height: 110rpx;
		width: 100%;
		position: absolute;
		text-align: center;
		top: 0;
		right: 0;
	}

	.courseScroll .courseContent .courseTime .left .course-time .time-start,
	.courseScroll .courseContent .courseTime .left .course-time .time-end {
		color: #8799a3;
		font-size: 20rpx;
		position: absolute;
		width: 100%;
		left: 0;
	}

	.courseScroll .courseContent .courseTime .left .course-time .time-start {
		top: 12rpx;
	}

	.courseScroll .courseContent .courseTime .left .course-time .time-end {
		bottom: 12rpx;
	}

	.courseScroll .courseContent .courseTime .left .number {
		font-size: 24rpx;
		line-height: 110rpx;
	}

	.course {
		width: 92%;
		margin: 0 auto;
	}

	.course .kcb-item {
		width: calc(92% / 7);
		position: absolute;
		justify-content: center;
		display: flex;
	}

	.course .kcb-item .smalltext {
		height: 100%;
		width: 100%;
		margin: 0 4rpx;
		font-size: 24rpx;
		line-height: 36rpx;
		text-align: center;
		color: #fff;
		border-radius: 8rpx;
		padding: 2rpx 4rpx;
		display: flex;
		flex-direction: column;
	}

	.course .kcb-item .smalltext .smalltextName {
		flex: 1 0 auto;
	}

	.course .kcb-item .smalltext .smalltextAddress {
		border-top: 1px solid #fff;
		flex: 0 0 auto;
	}
</style>
