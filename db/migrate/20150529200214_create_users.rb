class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.timestamps
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
    end
  end
end
