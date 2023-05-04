import { request } from "../utils/request.js"

export function denglu(data) {
	return request({
		url: '/login/denglu',
		method: 'post',
		data:{
			stuPhone:data
		}
	})
}
export function zhuce(data) {
	return request({
		url: '/login/register',
		method: 'post',
		data
	})
}