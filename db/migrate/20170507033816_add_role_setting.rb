class AddRoleSetting < ActiveRecord::Migration[5.0]
  def up
    add_column :role_settings, :name, :string
    add_index :role_settings, :name
    RoleSetting.create(name: 'admin', description: 'Admin')
    RoleSetting.create(name: 'moderator', description: 'Moderator')
    RoleSetting.create(name: 'autor', description: 'Autor')
  end

  def down
    remove_column :role_settings, :name, :string
    RoleSetting.destroy_all
  end
end
