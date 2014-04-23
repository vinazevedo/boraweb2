class AddLeadToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :lead, :string
  end
end
