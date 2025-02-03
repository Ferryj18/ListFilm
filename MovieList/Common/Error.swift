

import Foundation
import Alamofire

class AFErrorToString {
    static func convertToString(_ error: AFError) -> String {
        var errorString = "AFError: "

        switch error {
        case .invalidURL(let url):
            errorString += "Invalid URL: \(url)"
        case .parameterEncodingFailed(let reason):
            errorString += "Parameter Encoding Failed: \(reason)"
        case .multipartEncodingFailed(let reason):
            errorString += "Multipart Encoding Failed: \(reason)"
        case .responseValidationFailed(let reason):
            errorString += "Response Validation Failed: \(reason)"
        case .responseSerializationFailed(let reason):
            errorString += "Response Serialization Failed: \(reason)"
        case .createUploadableFailed(let reason):
            errorString += "Create Uploadable Failed: \(reason)"
        case .createURLRequestFailed(let reason):
            errorString += "Create URL Request Failed: \(reason)"
        case .downloadedFileMoveFailed(let underlyingError, let source, let destination):
            errorString += "Downloaded File Move Failed - Underlying Error: \(underlyingError), Source: \(source), Destination: \(destination)"
        case .explicitlyCancelled:
            errorString += "Request was explicitly cancelled."
        case .requestAdaptationFailed(let error):
            errorString += "Request Adaptation Failed: \(error)"
        case .requestRetryFailed(let retryError, let originalError):
            errorString += "Request Retry Failed - Retry Error: \(retryError), Original Error: \(originalError)"
        case .serverTrustEvaluationFailed(reason: let reason):
            errorString += "Server Trust Evaluation Failed: \(reason)"
        case .sessionDeinitialized:
            errorString += "Session has been deinitialized."
        case .urlRequestValidationFailed(let reason):
            errorString += "URL Request Validation Failed: \(reason)"
        case .parameterEncoderFailed(reason: let reason):
            errorString += "Unknown Error Occurred"
        case .sessionInvalidated(error: let error):
            errorString += "Unknown Error Occurred"
        case .sessionTaskFailed(error: let error):
            errorString += "Unknown Error Occurred"
        @unknown default:
            errorString += "Unknown Error Occurred"
        }

        return errorString
    }
}

class ErrorString{
    static func errorToString(_ error: Error) -> String {
        return error.localizedDescription
    }
}
