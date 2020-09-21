class ChangeUserColumnAdminDefaultToFalse < ActiveRecord::Migration[5.2]
  change_column :users, :admin, :boolean, :default => false
  #Ex:- change_column("admin_users", "email", :string, :limit =>25)
end
