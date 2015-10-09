class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :ip,     default:1,  null:false
      t.string  :domain, default:'', null:false

      t.timestamps null: false
    end
  end
end
