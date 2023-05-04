import { request } from "../utils/request.js"
export function submitin(data) {
	return request({
		url: '/suggest/saveSubmit',
		method: 'post',
		data
	})
	// console.log(data)
}
export function submitsearch(data) {
	return request({
		url: '/suggest/selectSubmit',
		method: 'get',
		data:{
			contents:'contents',
			fromname:'fromname',
			name:'name',
			type:'type'
		}
	})
}
export function deletesubmit(data) {
	return request({
		url: '/suggest/delSubmit',
		method: 'post',
		data
	})
}