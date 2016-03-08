class WikisController < ApplicationController
  before_filter :authenticate_user!


  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
    unless @wiki.private == false || (current_user.admin? || current_user.premium?)
    flash[:alert] = "You must be a premium member to view that"
    redirect_to request.referrer
  end

  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new(wiki_params)

    if @wiki.save
      flash[:notice] = "Your Wiki has been created"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving your Wiki, please try again."
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

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
    authorize Wiki

    if @wiki.delete
      flash[:notice] = "Your Wiki has been deleted"
      redirect_to wikis_path
    else
      flash.now[:alert] = "We couldn't delete your wiki, please try again."
      render :index
    end
  end
  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
