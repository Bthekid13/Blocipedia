class WikisController < ApplicationController
  before_filter :authenticate_user!

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
    #
    # unless @wiki.private == false || (current_user.admin? || current_user.premium?)
    # flash[:alert] = "You must be a premium member or a collaborator to view that"
    # redirect_to request.referrer
    # end
  end

  def new
    @wiki = Wiki.new
    @collaborations = User.all - [current_user]
    #Sometimes it's best to just ask yourself:
    #define what you're trying to do. Break it down to the most basic level.
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @wiki.user = current_user
    @collaborations = User.all - [@wiki.user]

  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user


    if @wiki.save
      flash[:notice] = "Your Wiki has been created"
      redirect_to @topic
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
      redirect_to @wiki
    else
      flash.now[:alert] = "We couldn't delete your wiki, please try again."
      render :index
    end
  end

  def premium
  end

  def standard
  end


  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, user_ids: [])
  end
end
