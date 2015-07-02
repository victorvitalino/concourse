class InformationsController < ApplicationController

  def cities
    render :json => City.where(state_id: params[:state])
  end

  def projects
    render :json => Project.all
  end
  
  def project_show
    @project = Project.find(params[:id])
    @navs    = @project.navs

    render :json => {project: @project, navs: @navs}
  end

  def navs
    render :json => Project.find(params[:id]).navs
  end

  def page_show
    render :json => Page.find(params[:id])
  end

end
