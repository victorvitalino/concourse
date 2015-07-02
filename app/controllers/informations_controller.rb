class InformationsController < ApplicationController

  def cities
    render :json => City.where(state_id: params[:state])
  end

  def projects
    render :json => Project.actives
  end
  
  def project_show
    @project = Project.actives.find(params[:id])
    @navs    = @project.navs.actives

    render :json => {project: @project, navs: @navs}
  end

  def page_show
    render :json => Page.actives.find(params[:id])
  end

end
