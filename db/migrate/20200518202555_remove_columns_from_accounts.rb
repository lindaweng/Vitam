class RemoveColumnsFromAccounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :creditCard, :string
    remove_column :accounts, :address, :string
    remove_column :accounts, :personalWords, :string
  end
end
