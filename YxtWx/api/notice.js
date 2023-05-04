import { request } from "../utils/request.js"

export function getNotice() {
	return request({
		url: '/assemblyHall/getRank?type=首页公告&num=3',
		method:'get'
	})
}
