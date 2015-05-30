class CreateCleaners < ActiveRecord::Migration
  def change
    create_table :cleaners do |t|

      t.timestamps
      t.string :name
      t.time :start_time
      t.time :end_time
    end
  end
end
