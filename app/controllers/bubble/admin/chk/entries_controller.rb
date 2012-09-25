#encoding: utf-8
class Bubble::Admin::Chk::EntriesController < Bubble::Admin::BaseController
  
  def checkable
    @search = BaseEntry.pending.search(params[:search])
    @notices = @search.page(params[:page])
  end
  
  def check
    @notice = BaseEntry.pending.find(params[:id])

    if !request.get?
      @notice.attributes = params[:notice]
      @notice.status = request.delete? ? :reject : :online

      if @notice.save
        flash[:notice] = "审核成功"
        redirect_to public_path(main_app.checkable_admin_chk_entries_path)
      end
    end
  end
  
end