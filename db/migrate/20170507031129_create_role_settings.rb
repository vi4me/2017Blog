class CreateRoleSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :role_settings do |t|
      t.string :description
      t.string :string

      t.timestamps
    end
  end
end
