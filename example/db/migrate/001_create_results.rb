class CreateResultsTable < Sequel::Migration

  # For the up we want to create the three tables.
  def up
    # Create the books table with a primary key and a title.
    create_table(:results) do
      primary_key :id
      String :template_name
      String :form_name
      Text :output

      timestamp :created_at
      timestamp :updated_at
       
    end
  end

  # For the down we want to remove the three tables.
  def down
    drop_table(:results)
  end
    
end
