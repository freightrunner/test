class SubjectsController < ApplicationController
  
  layout "admin" 

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    # Instantiate a new object
    @subject = Subject.new(subject_params)
    # Save the new instance of the object
    if @subject.save
      # If save succeeds, redirect to index
      flash[:notice] = "Subject created successfully"
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix errors
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
      # If update succeeds, redirect to show page
      flash[:notice] = "Subject updated successfully"
      redirect_to(:action => 'show', :id => @subject.id)
    else
      # If update fails, redisplay the form so user can fix errors
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject destroyed successfully"
    redirect_to(:action => 'index')
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end
end
