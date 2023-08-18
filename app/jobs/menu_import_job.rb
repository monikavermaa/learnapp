class MenuImportJob < ApplicationJob
  queue_as :default

  def perform(row_data)
  	Menu.create!(row_data)

    # Do something later
  end
end
