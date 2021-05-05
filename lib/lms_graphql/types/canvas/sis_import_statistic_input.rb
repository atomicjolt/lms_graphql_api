require_relative "../canvas_base_input_type"
require_relative "sis_import_statistic"
require_relative "sis_import_statistic"
require_relative "sis_import_statistic"
require_relative "sis_import_statistic"
require_relative "sis_import_statistic"
require_relative "sis_import_statistic"
require_relative "sis_import_statistic"
require_relative "sis_import_statistic"
require_relative "sis_import_statistic"
require_relative "sis_import_statistic"
require_relative "sis_import_statistic"
require_relative "sis_import_statistic"
require_relative "sis_import_statistic"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasSisImportStatisticInput < BaseInputObject
          description "SIS Imports. API Docs: https://canvas.instructure.com/doc/api/sis_imports.html"
      argument :total_state_changes, Int, "This is the total number of items that were changed in the sis import. There are a few caveats that can cause this number to not add up to the individual counts. There are some state changes that happen that have no impact to the object. An example would be changing a course from 'created' to 'claimed'. Both of these would be considered an active course, but would increment this counter. In this example the course would not increment the created or restored counters for course statistic..Example: 382", required: false
      argument :account, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for accounts..", required: false
      argument :enrollment_term, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for terms..", required: false
      argument :communication_channel, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for communication channels. This is an indirect effect from creating or deleting a user..", required: false
      argument :abstract_course, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for abstract courses..", required: false
      argument :course, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for courses..", required: false
      argument :course_section, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for course sections..", required: false
      argument :enrollment, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for enrollments..", required: false
      argument :group_category, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for group categories..", required: false
      argument :group, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for groups..", required: false
      argument :group_membership, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for group memberships. This can be a direct impact from the import or indirect from an enrollment being deleted..", required: false
      argument :pseudonym, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for pseudonyms. Pseudonyms are logins for users, and are the object that ties an enrollment to a user. This would be impacted from the user importer. .", required: false
      argument :user_observer, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for user observers..", required: false
      argument :account_user, LMSGraphQL::Types::Canvas::CanvasSisImportStatisticInput, "This contains that statistics for account users..", required: false

      end
    end
  end
end