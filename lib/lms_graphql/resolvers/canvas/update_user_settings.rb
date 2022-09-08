require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class UpdateUserSetting < CanvasBaseResolver
        type Boolean, null: false
        argument :id, ID, required: true
        argument :manual_mark_as_read, Boolean, required: false
        argument :release_notes_badge_disabled, Boolean, required: false
        argument :collapse_global_nav, Boolean, required: false
        argument :collapse_course_nav, Boolean, required: false
        argument :hide_dashcard_color_overlays, Boolean, required: false
        argument :comment_library_suggestions_enabled, Boolean, required: false
        argument :elementary_dashboard_disabled, Boolean, required: false
        def resolve(id:, manual_mark_as_read: nil, release_notes_badge_disabled: nil, collapse_global_nav: nil, collapse_course_nav: nil, hide_dashcard_color_overlays: nil, comment_library_suggestions_enabled: nil, elementary_dashboard_disabled: nil, get_all: false)
          result = context[:canvas_api].call("UPDATE_USER_SETTINGS").proxy(
            "UPDATE_USER_SETTINGS",
            {
              "id": id,
              "manual_mark_as_read": manual_mark_as_read,
              "release_notes_badge_disabled": release_notes_badge_disabled,
              "collapse_global_nav": collapse_global_nav,
              "collapse_course_nav": collapse_course_nav,
              "hide_dashcard_color_overlays": hide_dashcard_color_overlays,
              "comment_library_suggestions_enabled": comment_library_suggestions_enabled,
              "elementary_dashboard_disabled": elementary_dashboard_disabled            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end