import { request } from "../utils/request.js"

export function register(data) {
	return request({
		url: '/login/register',
		method: 'post',
		data:{
			code:data
		}
	})
}