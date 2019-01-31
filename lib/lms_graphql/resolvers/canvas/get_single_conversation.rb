require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleConversation < CanvasBaseResolver
        type Boolean, null: false
        argument :id, ID, required: true
        argument :interleave_submissions, Boolean, required: false
        argument :scope, String, required: false
        argument :filter, String, required: false
        argument :filter_mode, String, required: false
        argument :auto_mark_as_read, Boolean, required: false
        def resolve(id:, interleave_submissions: nil, scope: nil, filter: nil, filter_mode: nil, auto_mark_as_read: nil, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_CONVERSATION").proxy(
            "GET_SINGLE_CONVERSATION",
            {
              "id": id,
              "interleave_submissions": interleave_submissions,
              "scope": scope,
              "filter": filter,
              "filter_mode": filter_mode,
              "auto_mark_as_read": auto_mark_as_read            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end