class ReviewsController < ApplicationController

    before_action :find_review,   only: [:destroy]
    before_action :authenticate_user!
    before_action :authorize_user_review!, only: [:destroy]

    def create
        @idea = Idea.find params[:idea_id]
        @review=Review.new review_params
        @review.idea = @idea
        @review.user = current_user
        
        if @review.save
            redirect_to idea_path(@idea), notice: 'Review created!'
        else
            render '/ideas/show'
        end
    end
    
    def destroy
        if @review.destroy
        redirect_to idea_path(@idea), alert: "Idea deleted"
        else  
            render '/ideas/show'
        end
    end

    private

    def review_params
        params.require(:review).permit(:body)
    end

    def find_review
        @idea = Idea.find params[:idea_id]
        @review = Review.find params[:id]
    end

    def authorize_user_review!
        @review = Review.find params[:id]
        redirect_to idea_path(@idea), alert: 'Only the owner is authorized.' unless can?(:crud, @review)
    end
    


end
