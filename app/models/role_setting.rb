class RoleSetting < ApplicationRecord
	 has_and_belongs_to_many :roles

  class << self
    def admin
      find_by(name: 'admin')
    end

    def moderator
      find_by(name: 'moderator')
    end

    def autor
      find_by(name: 'autor')
    end
  end
end
