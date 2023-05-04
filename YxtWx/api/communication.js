import { request } from "@/utils/request.js"

export function getAllCommunication() {
	return request({
		url: '/assemblyHall/show',
		method: 'get'
	})
}

export function addCommunication(data) {
	return request({
		url: '/assemblyHall/save',
		method: 'post',
		data
	})
}

export function getAlltQuestionnaire() {
	return request({
		url: `/questionnaire/getQuestionnaireList`,
		method: 'get'
	})
}

export function getQuestionnaireDetail(data) {
	return request({
		url: `/questionnaire/getQuestionnaireDetail?id=${data}`,
		method: 'get'
	})
}

export function answerQuestionnaire(data) {
	return request({
		url: `/questionnaire/answer`,
		method: 'post',
		data
	})
}

export function isFinished(id) {
	return request({
		url: '/questionnaire/check?questionnaireId=' + id,
		method: 'get'
	})
}
