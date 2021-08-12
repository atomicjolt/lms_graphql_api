require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/course"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListActiveCoursesInAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCourse], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :with_enrollments, Boolean, required: false
        argument :enrollment_type, [String], required: false
        argument :published, Boolean, required: false
        argument :completed, Boolean, required: false
        argument :blueprint, Boolean, required: false
        argument :blueprint_associated, Boolean, required: false
        argument :by_teachers, [Int], required: false
        argument :by_subaccounts, [Int], required: false
        argument :hide_enrollmentless_courses, Boolean, required: false
        argument :state, [String], required: false
        argument :enrollment_term_id, ID, required: false
        argument :search_term, String, required: false
        argument :include, [String], required: false
        argument :sort, String, required: false
        argument :order, String, required: false
        argument :search_by, String, required: false
        argument :starts_before, LMSGraphQL::Types::DateTimeType, required: false
        argument :ends_after, LMSGraphQL::Types::DateTimeType, required: false
        argument :homeroom, Boolean, required: false
        def resolve(account_id:, with_enrollments: nil, enrollment_type: nil, published: nil, completed: nil, blueprint: nil, blueprint_associated: nil, by_teachers: nil, by_subaccounts: nil, hide_enrollmentless_courses: nil, state: nil, enrollment_term_id: nil, search_term: nil, include: nil, sort: nil, order: nil, search_by: nil, starts_before: nil, ends_after: nil, homeroom: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ACTIVE_COURSES_IN_ACCOUNT").proxy(
            "LIST_ACTIVE_COURSES_IN_ACCOUNT",
            {
              "account_id": account_id,
              "with_enrollments": with_enrollments,
              "enrollment_type": enrollment_type,
              "published": published,
              "completed": completed,
              "blueprint": blueprint,
              "blueprint_associated": blueprint_associated,
              "by_teachers": by_teachers,
              "by_subaccounts": by_subaccounts,
              "hide_enrollmentless_courses": hide_enrollmentless_courses,
              "state": state,
              "enrollment_term_id": enrollment_term_id,
              "search_term": search_term,
              "include": include,
              "sort": sort,
              "order": order,
              "search_by": search_by,
              "starts_before": starts_before,
              "ends_after": ends_after,
              "homeroom": homeroom            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end