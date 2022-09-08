require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_migration"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateContentMigrationGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :migration_type, String, required: true
        argument :pre_attachment_name, String, required: false
        argument :pre_attachment_star, String, required: false
        argument :settings_file_url, String, required: false
        argument :settings_content_export_id, String, required: false
        argument :settings_source_course_id, String, required: false
        argument :settings_folder_id, String, required: false
        argument :settings_overwrite_quizzes, Boolean, required: false
        argument :settings_question_bank_id, Int, required: false
        argument :settings_question_bank_name, String, required: false
        argument :settings_insert_into_module_id, Int, required: false
        argument :settings_insert_into_module_type, String, required: false
        argument :settings_insert_into_module_position, Int, required: false
        argument :settings_move_to_assignment_group_id, Int, required: false
        argument :settings_importer_skips, [String], required: false
        argument :date_shift_options_shift_dates, Boolean, required: false
        argument :date_shift_options_old_start_date, GraphQL::Types::ISO8601DateTime, required: false
        argument :date_shift_options_old_end_date, GraphQL::Types::ISO8601DateTime, required: false
        argument :date_shift_options_new_start_date, GraphQL::Types::ISO8601DateTime, required: false
        argument :date_shift_options_new_end_date, GraphQL::Types::ISO8601DateTime, required: false
        argument :date_shift_options_day_substitutions_X, Int, required: false
        argument :date_shift_options_remove_dates, Boolean, required: false
        argument :selective_import, Boolean, required: false
        argument :select, String, required: false
        
        
        field :content_migration, LMSGraphQL::Types::Canvas::CanvasContentMigration, null: false
        
        def resolve(group_id:, migration_type:, pre_attachment_name: nil, pre_attachment_star: nil, settings_file_url: nil, settings_content_export_id: nil, settings_source_course_id: nil, settings_folder_id: nil, settings_overwrite_quizzes: nil, settings_question_bank_id: nil, settings_question_bank_name: nil, settings_insert_into_module_id: nil, settings_insert_into_module_type: nil, settings_insert_into_module_position: nil, settings_move_to_assignment_group_id: nil, settings_importer_skips: nil, date_shift_options_shift_dates: nil, date_shift_options_old_start_date: nil, date_shift_options_old_end_date: nil, date_shift_options_new_start_date: nil, date_shift_options_new_end_date: nil, date_shift_options_day_substitutions_X: nil, date_shift_options_remove_dates: nil, selective_import: nil, select: nil)
          context[:canvas_api].call("CREATE_CONTENT_MIGRATION_GROUPS").proxy(
            "CREATE_CONTENT_MIGRATION_GROUPS",
            {
              "group_id": group_id
            },
            {
              "migration_type": migration_type,
              "pre_attachment[name]": pre_attachment_name,
              "pre_attachment[*]": pre_attachment_star,
              "settings[file_url]": settings_file_url,
              "settings[content_export_id]": settings_content_export_id,
              "settings[source_course_id]": settings_source_course_id,
              "settings[folder_id]": settings_folder_id,
              "settings[overwrite_quizzes]": settings_overwrite_quizzes,
              "settings[question_bank_id]": settings_question_bank_id,
              "settings[question_bank_name]": settings_question_bank_name,
              "settings[insert_into_module_id]": settings_insert_into_module_id,
              "settings[insert_into_module_type]": settings_insert_into_module_type,
              "settings[insert_into_module_position]": settings_insert_into_module_position,
              "settings[move_to_assignment_group_id]": settings_move_to_assignment_group_id,
              "settings[importer_skips]": settings_importer_skips,
              "date_shift_options[shift_dates]": date_shift_options_shift_dates,
              "date_shift_options[old_start_date]": date_shift_options_old_start_date,
              "date_shift_options[old_end_date]": date_shift_options_old_end_date,
              "date_shift_options[new_start_date]": date_shift_options_new_start_date,
              "date_shift_options[new_end_date]": date_shift_options_new_end_date,
              "date_shift_options[day_substitutions][X]": date_shift_options_day_substitutions_X,
              "date_shift_options[remove_dates]": date_shift_options_remove_dates,
              "selective_import": selective_import,
              "select": select
            },
          ).parsed_response
        end
      end
    end
  end
end