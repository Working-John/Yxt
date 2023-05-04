import { uploadRequest } from "../utils/request.js"

export function uploadFile(data) {
	return uploadRequest({
		filePath: data
	})
}
