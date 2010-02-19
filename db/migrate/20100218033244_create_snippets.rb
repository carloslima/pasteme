class CreateSnippets < ActiveRecord::Migration
  def self.up
    create_table :snippets do |t|
      t.text :code
      t.belongs_to :language

      t.timestamps
    end
  end

  def self.down
    drop_table :snippets
  end
end
