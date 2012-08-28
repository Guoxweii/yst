class PagesController < ApplicationController
  layout "ipanel"
  def show
    @area = Bubble::Area.where(code: (params[:area_code] || "yst")).first!
    @page = @area.find_page(params[:page_slug].to_s.split("/").last || "index")
  end
end