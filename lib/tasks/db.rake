namespace :db do
  desc "Truncate all tables and reseed the database"
  task truncate_and_seed: :environment do
    ActiveRecord::Base.connection.tables.each do |table|
      next if table == "schema_migrations"

      # Disable triggers
      ActiveRecord::Base.connection.execute("ALTER TABLE #{table} DISABLE TRIGGER ALL;")

      # Truncate the table
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} CASCADE;")

      # Re-enable triggers
      ActiveRecord::Base.connection.execute("ALTER TABLE #{table} ENABLE TRIGGER ALL;")
    end

    # Reset sequences
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.reset_pk_sequence!(table)
    end

    # Run seeds
    Rake::Task["db:seed"].invoke

    puts "Database truncated and reseeded successfully!"
  end
end
