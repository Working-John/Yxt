import { request } from "../utils/request.js"
export function postopinion(data) {
	return request({
		url: '/suggest/suggest',
		method: 'post',
		data
	})
}