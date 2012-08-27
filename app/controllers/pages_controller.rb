class PagesController < ApplicationController
  def show
    @area = Bubble::Area.where(code: params[:area_code]).first!
    @page = @area.find_page(params[:page_slug].split("/").last)
  end
end