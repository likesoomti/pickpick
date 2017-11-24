require 'csv'
namespace :import_space_infos_csv do
  task :create_space_infos => :environment do
    CSV.foreach("public/space_infos.csv") do |row|
      Space_info.create!(row.to_hash)
    end
  end
end