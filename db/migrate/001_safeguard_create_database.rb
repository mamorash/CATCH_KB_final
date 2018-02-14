class SafeguardCreateDatabase < ActiveRecord::Migration
  def up
    # if current migration version already has a created database
    if ActiveRecord::Migrator.current_version > 2
      # force the next migration 002_create_database.rb to be skipped
      ActiveRecord::SchemaMigration.create(version: '2')
      # the version '2' above is the version of the file which is (002 becomes 2)
    end
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end