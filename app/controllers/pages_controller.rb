class PagesController < ApplicationController
  
  layout "admin"
  before_action :confirm_logged_in
  
  def index
    @pages = Page.order("pages.position ASC")
  end

  def show
    @page =Page.find(params[:id])
  end

  def new
    @page = Page.new
    @page_count = Page.count + 1
    @subjects = Subject.order('position ASC')
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully"
      redirect_to(:action => 'index')
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count + 1
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.order('position ASC')
    @page_count = Page.count
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfully"
      redirect_to(:action => 'show', :id => @page.id)
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}' successfully destroyed"
    redirect_to(:action => 'index')
  end

  private

    def page_params
      params.require(:page).permit(:name,
                                   :subject_id,
                                   :permalink,
                                   :position,
                                   :visible)
    end
  
end
