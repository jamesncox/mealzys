class ClientRestrictions < ActiveRecord::Migration[5.2]
  def change
    create_table :client_restrictions do |t|
      t.belongs_to :client
      t.belongs_to :restriction
      
      t.timestamps
    end
  end
end
