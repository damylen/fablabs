class Backstage::ToApproveLabsController < ApplicationController

  def index
    @q = Lab.includes(:creator).where("referee_id IN (?)",  current_user.admin_labs.map{ |u| u.resource_id }).search(params[:q])

    @q.sorts = 'id desc' if @q.sorts.empty?
    @labs = @q.result.page(params[:page]).per(params[:per])
  end
end
