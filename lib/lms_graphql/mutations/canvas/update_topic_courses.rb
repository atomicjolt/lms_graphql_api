require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateTopicCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :title, String, required: false
        argument :message, String, required: false
        argument :discussion_type, String, required: false
        argument :published, Boolean, required: false
        argument :delayed_post_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :lock_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :podcast_enabled, Boolean, required: false
        argument :podcast_has_student_posts, Boolean, required: false
        argument :require_initial_post, Boolean, required: false
        argument :assignment, String, required: false
        argument :is_announcement, Boolean, required: false
        argument :pinned, Boolean, required: false
        argument :position_after, String, required: false
        argument :group_category_id, ID, required: false
        argument :allow_rating, Boolean, required: false
        argument :only_graders_can_rate, Boolean, required: false
        argument :sort_by_rating, Boolean, required: false
        argument :specific_sections, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, topic_id:, title: nil, message: nil, discussion_type: nil, published: nil, delayed_post_at: nil, lock_at: nil, podcast_enabled: nil, podcast_has_student_posts: nil, require_initial_post: nil, assignment: nil, is_announcement: nil, pinned: nil, position_after: nil, group_category_id: nil, allow_rating: nil, only_graders_can_rate: nil, sort_by_rating: nil, specific_sections: nil)
          context[:canvas_api].call("UPDATE_TOPIC_COURSES").proxy(
            "UPDATE_TOPIC_COURSES",
            {
              "course_id": course_id,
              "topic_id": topic_id
            },
            {
              "title": title,
              "message": message,
              "discussion_type": discussion_type,
              "published": published,
              "delayed_post_at": delayed_post_at,
              "lock_at": lock_at,
              "podcast_enabled": podcast_enabled,
              "podcast_has_student_posts": podcast_has_student_posts,
              "require_initial_post": require_initial_post,
              "assignment": assignment,
              "is_announcement": is_announcement,
              "pinned": pinned,
              "position_after": position_after,
              "group_category_id": group_category_id,
              "allow_rating": allow_rating,
              "only_graders_can_rate": only_graders_can_rate,
              "sort_by_rating": sort_by_rating,
              "specific_sections": specific_sections
            },
          ).parsed_response
        end
      end
    end
  end
end