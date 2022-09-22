class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  default_scope { order(updated_at: :desc) }
end
