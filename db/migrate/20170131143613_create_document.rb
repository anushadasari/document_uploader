class CreateDocument < ActiveRecord::Migration
  def up
    create_table :documents do |t|
    	t.integer		  :category, :limit =>2
      t.attachment  :attachment
    	t.integer 	  :s3_status, :limit => 2
    	t.integer  	  :reference_number, :limit => 4
    	t.datetime	  :validity_start 
    	t.datetime 	  :validity_end
    	t.integer 	  :uploaded_by, :limit => 3 
      t.integer     :documentable_id
      t.string		  :documentable_type
    	t.timestamps 	null: false
    end
  end

  def down
  	drop_table :documents
  end
end
