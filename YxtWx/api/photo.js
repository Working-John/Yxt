import { request } from "../utils/request.js"

export function postPhoto(consquence) {
	return request({
		url: '/daka/dwdaka',
		method: 'post',
		data:{
			consquence:consquence
		}
	})
}
export function postopinion(data) {
	return request({
		url: '/suggest/suggest',
		method: 'post',
		data
	})
}