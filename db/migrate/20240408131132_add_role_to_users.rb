class AddRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    create_enum :users_role_enum, ["teacher", "student"]
    add_column :users, :role, :users_role_enum, default: "teacher", null: false, if_not_exists: true
  end
end
