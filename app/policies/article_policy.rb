class ArticlePolicy < ApplicationPolicy

  def admin?
    user && user.role_settings.include?(RoleSetting.admin)
  end

  def moderator?
    user && user.role_settings.include?(RoleSetting.moderator)
  end

  def autor?
    user && user.role_settings.include?(RoleSetting.autor)
  end
end
