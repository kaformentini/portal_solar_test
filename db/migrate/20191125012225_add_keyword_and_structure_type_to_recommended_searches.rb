class AddKeywordAndStructureTypeToRecommendedSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :recommended_searches, :keyword, :string
    add_column :recommended_searches, :structure_type, :integer
  end
end
