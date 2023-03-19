class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: "リストを投稿しました"
    else
      render 'lists/new'
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list), notice: "リストを更新しました"
    else
      render 'lists/edit'
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to lists_path, notice: "リストを削除しました"
    else
      render 'lists/show'
    end
  end


  private

  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
