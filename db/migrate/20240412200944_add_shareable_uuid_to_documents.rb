class AddShareableUuidToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :uuid, :uuid, default: "gen_random_uuid()"
  end
end
