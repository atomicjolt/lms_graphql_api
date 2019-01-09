require_relative "../canvas_base_type"
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
      class CanvasSisImportStatistic < BaseType
        description "SIS Imports. API Docs: https://canvas.instructure.com/doc/api/sis_imports.html"
        field :total_state_changes, Int, "This is the total number of items that were changed in the sis import. There are a few caveats that can cause this number to not add up to the individual counts. There are some state changes that happen that have no impact to the object. An example would be changing a course from 'created' to 'claimed'. Both of these would be considered an active course, but would increment this counter. In this example the course would not increment the created or restored counters for course statistic..Example: 382", null: true
        field :account, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for accounts..", null: true
        field :enrollment_term, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for terms..", null: true
        field :communication_channel, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for communication channels. This is an indirect effect from creating or deleting a user..", null: true
        field :abstract_course, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for abstract courses..", null: true
        field :course, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for courses..", null: true
        field :course_section, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for course sections..", null: true
        field :enrollment, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for enrollments..", null: true
        field :group_category, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for group categories..", null: true
        field :group, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for groups..", null: true
        field :group_membership, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for group memberships. This can be a direct impact from the import or indirect from an enrollment being deleted..", null: true
        field :pseudonym, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for pseudonyms. Pseudonyms are logins for users, and are the object that ties an enrollment to a user. This would be impacted from the user importer. .", null: true
        field :user_observer, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for user observers..", null: true
        field :account_user, LMSGraphQL::Types::Canvas::CanvasSisImportStatistic, "This contains that statistics for account users..", null: true

      end
    end
  end
end