class CreateResultsItemsTable < Sequel::Migration

  # For the up we want to create the three tables.
  def up
    # Create the books table with a primary key and a title.
    create_table(:result_items) do
      primary_key :id
      foreign_key :result_id
      String :name
      Text :value
      String :title
      String :type

      timestamp :created_at
      timestamp :updated_at
       
    end
  end

  # For the down we want to remove the three tables.
  def down
    drop_table(:results)
  end
    
end
