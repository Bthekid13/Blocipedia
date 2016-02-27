class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Your Wiki has been created"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving your Wiki, please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Your wiki has been updated"
      redirect_to @wiki
    else
      flash.now[:alert] = "Your wiki could not be saved"
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.delete
      flash[:notice] = "Your Wiki has been deleted"
      redirect_to wikis_path
    else
      flash.now[:alert] = "We couldn't delete your wiki, please try again."
      render :show
    end
  end
end
