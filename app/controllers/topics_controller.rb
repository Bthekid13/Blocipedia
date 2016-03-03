class TopicsController < ApplicationController
  def index
    @topic = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def edit
  @topic = Topic.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
