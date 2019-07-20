# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :users_roles, dependent: :destroy
  has_many :users, through: :users_roles

  belongs_to :resource, polymorphic: true, optional: true

  validates :resource_type, inclusion: { in: Rolify.resource_types }, allow_nil: true
  validates :name,
            inclusion: {
              in: %w[
                super_admin
                admin
                member
              ]
            }
  scopify
end
