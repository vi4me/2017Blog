class CreateRoleSettingsRolesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :role_settings_roles, id: false do |t|
      t.integer :role_setting_id
      t.integer :role_id
    end

    add_index :role_settings_roles, :role_setting_id
    add_index :role_settings_roles, :role_id
  end
end
