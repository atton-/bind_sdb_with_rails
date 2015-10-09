class CreateReverseRecords < ActiveRecord::Migration
  def change
    create_table :reverse_records do |t|
      t.references :record, index: true, foreign_key: true
      t.string  :name,   default: '',   null:false
      t.string  :rdata , default: '',   null:false
      t.string  :rdtype, default: '',   null:false
      t.integer :ttl,    default: 3600, null: false

      t.timestamps null: false
    end
  end
end
