require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/discussion_topic"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListDiscussionTopicsGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasDiscussionTopic], null: false
        argument :get_all, Boolean, required: false
        argument :group_id, ID, required: true
        argument :include, [String], required: false
        argument :order_by, String, required: false
        argument :scope, String, required: false
        argument :only_announcements, Boolean, required: false
        argument :filter_by, String, required: false
        argument :search_term, String, required: false
        argument :exclude_context_module_locked_topics, Boolean, required: false
        def resolve(group_id:, include: nil, order_by: nil, scope: nil, only_announcements: nil, filter_by: nil, search_term: nil, exclude_context_module_locked_topics: nil, get_all: false)
          result = context[:canvas_api].call("LIST_DISCUSSION_TOPICS_GROUPS").proxy(
            "LIST_DISCUSSION_TOPICS_GROUPS",
            {
              "group_id": group_id,
              "include": include,
              "order_by": order_by,
              "scope": scope,
              "only_announcements": only_announcements,
              "filter_by": filter_by,
              "search_term": search_term,
              "exclude_context_module_locked_topics": exclude_context_module_locked_topics            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end