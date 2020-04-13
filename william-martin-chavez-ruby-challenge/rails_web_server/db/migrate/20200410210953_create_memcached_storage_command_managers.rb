class CreateMemcachedStorageCommandManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :memcached_storage_command_managers do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
