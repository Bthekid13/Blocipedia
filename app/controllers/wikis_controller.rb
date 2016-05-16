# == Schema Information
#
# Table name: wikis
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  private    :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#  users_id   :integer
#

class WikisController < ApplicationController
  before_filter :authenticate_user!


  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    @collaborations = User.all - [current_user]
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
      flash[:notice] = "Your Wiki has been created"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving your Wiki, please try again."
      render :new
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

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, user_ids: [])
  end
end
