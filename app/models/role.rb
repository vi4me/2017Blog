class Role < ApplicationRecord
  has_many :users
  has_and_belongs_to_many :role_settings
end
