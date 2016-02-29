class SubjectsController < ApplicationController
  
  layout false 

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
      redirect_to(:action => 'show', :id => @subject.id)
    else
      # If update fails, redisplay the form so user can fix errors
      render('edit')
    end
  end

  def delete
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end
end
