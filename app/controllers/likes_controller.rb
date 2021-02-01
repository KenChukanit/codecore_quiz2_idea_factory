class LikesController < ApplicationController

    def create
        idea = Idea.find params[:idea_id]
        like = Like.new idea: idea, user: current_user
       
        if  like.save
            flash[:notice] = 'You like the idea'
        else   
            flash[:alert] = like.errors.full_messages.join(', ')
        end
        redirect_to idea_path(idea)
    end
    
    def destroy
        like = current_user.likes.find params[:id]
        if !can?(:destroy, like)
            flash[:alert] = 'You can only unlike your liked idea'
        elsif like.destroy
            flash[:alert] = "Idea unliked"
        else
            flash[:alert] = "Could not unlike the idea"
        end
        redirect_to idea_path(like.idea)
    end




end
