class PublishersController < ApplicationController

  def new
   @publisher = Publisher.new
  end

  def index
    @publishers = Publisher.all
  end

  def show
    @publisher = Publisher.find(params[:id])
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update(publisher_params)
      flash[:success] = 'Publisher infos updated successfuly'
      redirect_to publisher_path(@publisher)
    else
      render :edit
   end
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy
  		flash[:warning] = 'Publisher infos deleted successfuly'
  		redirect_to publishers_path
  end

  def create
    @publisher = Publisher.create(publisher_params)
    if @publisher.save
      redirect_to publishers_path, notice: 'Publisher has been saved'
    else

      render :new
    end
  end


  private

  def publisher_params
    params.require(:publisher).permit(:name, :established_year, :email)
  end

end
