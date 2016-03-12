class WikisController < ApplicationController
  before_filter :authenticate_user!

  def show
    @wiki = Wiki.find(params[:id])

    unless @wiki.private == false || (current_user.admin? || current_user.premium?)
    flash[:alert] = "You must be a premium member or a collaborator to view that"
    redirect_to request.referrer
    end
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all
    @wiki.user_ids = params[:user_ids]
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @topic = Topic.find(params[:topic_id])
    @wiki.topic = @topic


    if @wiki.save
      flash[:notice] = "Your Wiki has been created"
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error saving your Wiki, please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    @wiki.user_ids = params[:user_id]


    if @wiki.save
      flash[:notice] = "Your wiki has been updated"
      redirect_to [@wiki.topic, @wiki]
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
      redirect_to @wiki.topic
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
