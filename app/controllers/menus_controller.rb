class MenusController < ApplicationController

  def import
    MenuImportService.import(params[:file])
    redirect_to root_path, notice: "CSV upload started. It will be processed in the background."
  end

  def index
    @menu_items = Menu.all
  end

  def destroy
  	@meenu_item = Menu.find(params[:id])
  	@meenu_item.delete
  end
 
end
