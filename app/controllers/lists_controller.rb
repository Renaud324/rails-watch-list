class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # raise
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created.'
    else
      render :new # Render the 'new' view again if the list can't be saved
    end
  end

  private

  def params_list
    params.require(:list).permit(:name)
  end

end
