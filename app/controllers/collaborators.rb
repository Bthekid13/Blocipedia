class Collaborators < ApplicationController

def create
  @collaborator = Collaborator.new(wiki_id: @wiki_id, user_id: params[:user_id])
  if @collaborator.save
    flash[:notice] = "Your Wiki was updated"
    redirect_to edit_topic_wiki_path(@wiki)
  else
    flash.now[:alert] = "There was an error. Please try again."
    render :new
end

def destroy

end

end
