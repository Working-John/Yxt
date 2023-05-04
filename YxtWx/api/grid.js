import { request } from "../utils/request.js"

export function getPeopleList() {
	return request({
		url: '/grid/listAllWorker',
		method:'get'
	})
}
export function addTeacher(teachername,examinationTypeArrayType,temperature,img
// ,publishTime
){
	return request({
		url:'/teacher/teacherReportUp',
		method:'post',
		data:{
			teachername:teachername,
			course:examinationTypeArrayType,
			remark:temperature,
			imgname:img,
			// publishTime:publishTime,
		}
	})
}
// export function getreport(data) {
// 	return request({
// 		url: '/daka/selectName',
// 		method:'post',
// 		data:{
// 			name:'name'
// 		}
// 	})
// }