class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
        t.string :name
        t.string :phoneNumber
        t.string :email
        t.string :password
        t.string :level
        t.string :emailWords, array: true, default: []
        t.string :contacts, array: true, default: []
        t.string :personalWords, array: true, default: []
        t.string :creditCard, array: true, default: []
        t.string :address, array: true, default: []
        t.timestamps null: false
      end
  end
end
