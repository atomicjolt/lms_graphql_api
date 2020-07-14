require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetUploadedMediaFolderForUserCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasFolder, null: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("GET_UPLOADED_MEDIA_FOLDER_FOR_USER_COURSES").proxy(
            "GET_UPLOADED_MEDIA_FOLDER_FOR_USER_COURSES",
            {
              "course_id": course_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end