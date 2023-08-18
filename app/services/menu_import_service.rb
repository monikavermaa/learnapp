require 'csv'

class MenuImportService
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # Menu.create!(row.to_h)
      MenuImportJob.perform_later(row.to_h)

    end
  end
end
