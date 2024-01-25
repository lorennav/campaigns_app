class CreateCampaigns < ActiveRecord::Migration[7.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :description
      t.integer :state
      t.datetime :publication_date
      t.integer :position

      t.timestamps
    end
  end
end
