class AddIndividualToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nick_name, :string
    add_column :users, :family_name, :string
    add_column :users, :first_name, :string
    add_column :users, :furigana_family_name, :string
    add_column :users, :furigana_first_name, :string
    add_column :users, :birthday, :date
  end
end
