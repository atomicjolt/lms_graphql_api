require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateCourse < BaseMutation
        argument :id, ID, required: true
        argument :course_account_id, Int, required: false
        argument :course_name, String, required: false
        argument :course_course_code, String, required: false
        argument :course_start_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :course_end_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :course_license, String, required: false
        argument :course_is_public, Boolean, required: false
        argument :course_is_public_to_auth_users, Boolean, required: false
        argument :course_public_syllabus, Boolean, required: false
        argument :course_public_syllabus_to_auth, Boolean, required: false
        argument :course_public_description, String, required: false
        argument :course_allow_student_wiki_edits, Boolean, required: false
        argument :course_allow_wiki_comments, Boolean, required: false
        argument :course_allow_student_forum_attachments, Boolean, required: false
        argument :course_open_enrollment, Boolean, required: false
        argument :course_self_enrollment, Boolean, required: false
        argument :course_restrict_enrollments_to_course_dates, Boolean, required: false
        argument :course_term_id, Int, required: false
        argument :course_sis_course_id, String, required: false
        argument :course_integration_id, String, required: false
        argument :course_hide_final_grades, Boolean, required: false
        argument :course_time_zone, String, required: false
        argument :course_apply_assignment_group_weights, Boolean, required: false
        argument :course_storage_quota_mb, Int, required: false
        argument :offer, Boolean, required: false
        argument :course_event, String, required: false
        argument :course_default_view, String, required: false
        argument :course_syllabus_body, String, required: false
        argument :course_syllabus_course_summary, Boolean, required: false
        argument :course_grading_standard_id, Int, required: false
        argument :course_grade_passback_setting, String, required: false
        argument :course_course_format, String, required: false
        argument :course_image_id, Int, required: false
        argument :course_image_url, String, required: false
        argument :course_remove_image, Boolean, required: false
        argument :course_remove_banner_image, Boolean, required: false
        argument :course_blueprint, Boolean, required: false
        argument :course_blueprint_restrictions, String, required: false
        argument :course_use_blueprint_restrictions_by_object_type, Boolean, required: false
        argument :course_blueprint_restrictions_by_object_type, String, required: false
        argument :course_homeroom_course, Boolean, required: false
        argument :course_sync_enrollments_from_homeroom, String, required: false
        argument :course_homeroom_course_id, String, required: false
        argument :course_template, Boolean, required: false
        argument :course_course_color, String, required: false
        argument :course_friendly_name, String, required: false
        argument :course_enable_course_paces, Boolean, required: false
        argument :course_conditional_release, Boolean, required: false
        argument :override_sis_stickiness, Boolean, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(id:, course_account_id: nil, course_name: nil, course_course_code: nil, course_start_at: nil, course_end_at: nil, course_license: nil, course_is_public: nil, course_is_public_to_auth_users: nil, course_public_syllabus: nil, course_public_syllabus_to_auth: nil, course_public_description: nil, course_allow_student_wiki_edits: nil, course_allow_wiki_comments: nil, course_allow_student_forum_attachments: nil, course_open_enrollment: nil, course_self_enrollment: nil, course_restrict_enrollments_to_course_dates: nil, course_term_id: nil, course_sis_course_id: nil, course_integration_id: nil, course_hide_final_grades: nil, course_time_zone: nil, course_apply_assignment_group_weights: nil, course_storage_quota_mb: nil, offer: nil, course_event: nil, course_default_view: nil, course_syllabus_body: nil, course_syllabus_course_summary: nil, course_grading_standard_id: nil, course_grade_passback_setting: nil, course_course_format: nil, course_image_id: nil, course_image_url: nil, course_remove_image: nil, course_remove_banner_image: nil, course_blueprint: nil, course_blueprint_restrictions: nil, course_use_blueprint_restrictions_by_object_type: nil, course_blueprint_restrictions_by_object_type: nil, course_homeroom_course: nil, course_sync_enrollments_from_homeroom: nil, course_homeroom_course_id: nil, course_template: nil, course_course_color: nil, course_friendly_name: nil, course_enable_course_paces: nil, course_conditional_release: nil, override_sis_stickiness: nil)
          context[:canvas_api].call("UPDATE_COURSE").proxy(
            "UPDATE_COURSE",
            {
              "id": id
            },
            {
              "course[account_id]": course_account_id,
              "course[name]": course_name,
              "course[course_code]": course_course_code,
              "course[start_at]": course_start_at,
              "course[end_at]": course_end_at,
              "course[license]": course_license,
              "course[is_public]": course_is_public,
              "course[is_public_to_auth_users]": course_is_public_to_auth_users,
              "course[public_syllabus]": course_public_syllabus,
              "course[public_syllabus_to_auth]": course_public_syllabus_to_auth,
              "course[public_description]": course_public_description,
              "course[allow_student_wiki_edits]": course_allow_student_wiki_edits,
              "course[allow_wiki_comments]": course_allow_wiki_comments,
              "course[allow_student_forum_attachments]": course_allow_student_forum_attachments,
              "course[open_enrollment]": course_open_enrollment,
              "course[self_enrollment]": course_self_enrollment,
              "course[restrict_enrollments_to_course_dates]": course_restrict_enrollments_to_course_dates,
              "course[term_id]": course_term_id,
              "course[sis_course_id]": course_sis_course_id,
              "course[integration_id]": course_integration_id,
              "course[hide_final_grades]": course_hide_final_grades,
              "course[time_zone]": course_time_zone,
              "course[apply_assignment_group_weights]": course_apply_assignment_group_weights,
              "course[storage_quota_mb]": course_storage_quota_mb,
              "offer": offer,
              "course[event]": course_event,
              "course[default_view]": course_default_view,
              "course[syllabus_body]": course_syllabus_body,
              "course[syllabus_course_summary]": course_syllabus_course_summary,
              "course[grading_standard_id]": course_grading_standard_id,
              "course[grade_passback_setting]": course_grade_passback_setting,
              "course[course_format]": course_course_format,
              "course[image_id]": course_image_id,
              "course[image_url]": course_image_url,
              "course[remove_image]": course_remove_image,
              "course[remove_banner_image]": course_remove_banner_image,
              "course[blueprint]": course_blueprint,
              "course[blueprint_restrictions]": course_blueprint_restrictions,
              "course[use_blueprint_restrictions_by_object_type]": course_use_blueprint_restrictions_by_object_type,
              "course[blueprint_restrictions_by_object_type]": course_blueprint_restrictions_by_object_type,
              "course[homeroom_course]": course_homeroom_course,
              "course[sync_enrollments_from_homeroom]": course_sync_enrollments_from_homeroom,
              "course[homeroom_course_id]": course_homeroom_course_id,
              "course[template]": course_template,
              "course[course_color]": course_course_color,
              "course[friendly_name]": course_friendly_name,
              "course[enable_course_paces]": course_enable_course_paces,
              "course[conditional_release]": course_conditional_release,
              "override_sis_stickiness": override_sis_stickiness
            },
          ).parsed_response
        end
      end
    end
  end
end