require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateCourseSetting < BaseMutation
        argument :course_id, ID, required: true
        argument :allow_student_discussion_topics, Boolean, required: false
        argument :allow_student_forum_attachments, Boolean, required: false
        argument :allow_student_discussion_editing, Boolean, required: false
        argument :allow_student_organized_groups, Boolean, required: false
        argument :allow_student_discussion_reporting, Boolean, required: false
        argument :allow_student_anonymous_discussion_topics, Boolean, required: false
        argument :filter_speed_grader_by_student_group, Boolean, required: false
        argument :hide_final_grades, Boolean, required: false
        argument :hide_distribution_graphs, Boolean, required: false
        argument :hide_sections_on_course_users_page, Boolean, required: false
        argument :lock_all_announcements, Boolean, required: false
        argument :usage_rights_required, Boolean, required: false
        argument :restrict_student_past_view, Boolean, required: false
        argument :restrict_student_future_view, Boolean, required: false
        argument :show_announcements_on_home_page, Boolean, required: false
        argument :home_page_announcement_limit, Int, required: false
        argument :syllabus_course_summary, Boolean, required: false
        argument :default_due_time, String, required: false
        argument :conditional_release, Boolean, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, allow_student_discussion_topics: nil, allow_student_forum_attachments: nil, allow_student_discussion_editing: nil, allow_student_organized_groups: nil, allow_student_discussion_reporting: nil, allow_student_anonymous_discussion_topics: nil, filter_speed_grader_by_student_group: nil, hide_final_grades: nil, hide_distribution_graphs: nil, hide_sections_on_course_users_page: nil, lock_all_announcements: nil, usage_rights_required: nil, restrict_student_past_view: nil, restrict_student_future_view: nil, show_announcements_on_home_page: nil, home_page_announcement_limit: nil, syllabus_course_summary: nil, default_due_time: nil, conditional_release: nil)
          context[:canvas_api].call("UPDATE_COURSE_SETTINGS").proxy(
            "UPDATE_COURSE_SETTINGS",
            {
              "course_id": course_id
            },
            {
              "allow_student_discussion_topics": allow_student_discussion_topics,
              "allow_student_forum_attachments": allow_student_forum_attachments,
              "allow_student_discussion_editing": allow_student_discussion_editing,
              "allow_student_organized_groups": allow_student_organized_groups,
              "allow_student_discussion_reporting": allow_student_discussion_reporting,
              "allow_student_anonymous_discussion_topics": allow_student_anonymous_discussion_topics,
              "filter_speed_grader_by_student_group": filter_speed_grader_by_student_group,
              "hide_final_grades": hide_final_grades,
              "hide_distribution_graphs": hide_distribution_graphs,
              "hide_sections_on_course_users_page": hide_sections_on_course_users_page,
              "lock_all_announcements": lock_all_announcements,
              "usage_rights_required": usage_rights_required,
              "restrict_student_past_view": restrict_student_past_view,
              "restrict_student_future_view": restrict_student_future_view,
              "show_announcements_on_home_page": show_announcements_on_home_page,
              "home_page_announcement_limit": home_page_announcement_limit,
              "syllabus_course_summary": syllabus_course_summary,
              "default_due_time": default_due_time,
              "conditional_release": conditional_release
            },
          ).parsed_response
        end
      end
    end
  end
end