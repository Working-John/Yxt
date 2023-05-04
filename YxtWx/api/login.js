import { request } from "../utils/request.js"

export function login(data) {
	return request({
		url: '/login/wechatLogin',
		method: 'post',
		data:{
			code:data
		}
	})
}

export function ifFirstLogin() {
	return request({
		url: '/login/selectUser',
		method: 'get',
	})
}

export function ifgarde() {
	return request({
		url: '/login/selectUser',
		method: 'get',
		data:{
			garde:garde
		}
	})
}

export function findStudent() {
	return request({
		url: '/login/findStudent',
		method: 'get',
		data:{
//		name:name
		}
	})
}

export function findUser() {
	return request({
		url: '/login/findUser',
		method: 'get',
		data:{
//		name:name
		}
	})
}

export function logOut() {
	return request({
		url: '/login/deleteUser',
		method: 'get',
		data:{
		}
	})
}
// export function ifnotlogins(){
// 	return request({
// 		url:'/login/register',
// 		method:'post',
// 		data:{
// 			code:data
// 		}
// 	})
// }