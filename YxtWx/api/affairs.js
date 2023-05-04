import { request } from "../utils/request.js"

export function getAffairsList() {
	return request({
		url: '/event/getEventList',
		method:'get'
	})
}

export function getProgress(id) {
	console.log("id",id);
	return request({
		url: '/event/show',
		method:'get',
		data:{
			id:id
		}
	})
}
