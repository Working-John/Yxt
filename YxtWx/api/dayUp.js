import { request } from "../utils/request.js"

export function dayUp(data) {
	return request({
		url: '/report/saveDayReport',
		method: 'post',
		data
	})
}
export function examine(date) {
	return request({
		url: '/daka/selectName',
		method: 'POST',
		data: {
			time:date,
		},
	})
}
export function examine1(date) {
	return request({
		url: '/daka/selectStudent',
		method: 'POST',
		data: {
			time:date,
		},
	})
}

export function examine2(data) {
	return request({
		url: '/report/selectDaka',
		method: 'get',
		data: {
		   // id: 1,
		   judge: 'judge',
		   name: 'name',
		   statue:'statue',
		   time:'time',
		   passage:'passage'
		      },
	})
}
export function timeFind(date1,date2){
	return request({
		url:'/daka/timeFind',
		method:'post',
		data:{
			date1:date1,
			date2:date2,
			//name:chooseName,
		}
	})
}
export function examine3(date) {
	console.log(date)
	return request({
		url: '/report/selectName',
		method: 'post',
		data:{
			time:date
		}
	})
}
export function timeFind1(date1,date2){
	return request({
		url: '/report/timeFind',
		method: 'post',
		data:{
			date1:date1,
			date2:date2,
		}
	})
}
