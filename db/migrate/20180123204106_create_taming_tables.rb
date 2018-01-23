class CreateTamingTables < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :family_id
    end

    create_table :children do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :family_id
    end

    create_table :chores do |t|
      t.string :name
      t.integer :time_to_complete
      t.boolean :completed
      t.integer :parent_id
      t.integer :child_id
    end

    create_table :families do |t|
      t.string :name
    end
  end
end
