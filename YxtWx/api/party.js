import { request } from "../utils/request.js"

export function getWorkList() {
	return request({
		url: '/microWork/listAllWork',
		method:'get'
	})
}

export function getNoticeList() {
	return request({
		url:'/open/listAllOpen',
		method:'get'
	})
}

export function submitBoard(subDate,advice) {
	console.log(advice);
	console.log(subDate);
	return request({
		url:'/parMemAdvice/addAdvice',
		method:'post',
		data:{
			advice:advice,
			subDate:subDate
		}
	})
}