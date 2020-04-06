class CreateMemcachedRetrievalCommandManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :memcached_retrieval_command_managers do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
