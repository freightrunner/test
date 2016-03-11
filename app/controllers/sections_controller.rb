class SectionsController < ApplicationController
  
  layout "admin"
  before_action :confirm_logged_in
  before_action :find_page


  def index
    @sections = Section.where(:page_id => @page.id).order("position ASC")
    # @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:page_id => @page.id})
    @pages = Page.order('position ASC')
    @section_count = Section.count + 1
  end

  def create
    @section = Section.new(section_params)
    if @section.save
       flash[:notice] = "Section saved completely"
       redirect_to(:action => 'index', :page_id => @page.id)
     else
      @pages = Page.order('position ASC')
      @section_count = Section.count + 1
      render('new')
     end 
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.order('position ASC')
    @section_count = Section.count 
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
      redirect_to(:action => 'show', :id => @section.id, :page_id => @page.id)
    else
      @pages = Page.order('position ASC')
      @section_count = Section.count 
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).delete
    flash[:notice] = "Section '#{section.name}' successfully destroyed"
    redirect_to(:action => 'index', :page_id => @page.id)
  end

  private

    def section_params
      params.require(:section).permit(:name, :page_id, :position, :visible, :content_type, :content)
    end

    def find_page
      if params[:page_id]
        @page = Page.find(params[:page_id])
      end
    end
end
