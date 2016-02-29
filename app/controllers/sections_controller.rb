class SectionsController < ApplicationController
  
  layout "admin"


  def index
    @sections = Section.order("sections.position ASC")
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
       flash[:notice] = "Section saved completely"
       redirect_to(:action => 'index')
     else
      render('new')
     end 
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
      redirect_to(:action => 'show', :id => @section.id)
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).delete
    flash[:notice] = "Section '#{section.name}' successfully destroyed"
    redirect_to(:action => 'index')
  end

  private

    def section_params
      params.require(:section).permit(:name, :position, :visible, :content_type, :content)
    end
end
