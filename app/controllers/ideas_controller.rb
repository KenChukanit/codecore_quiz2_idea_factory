class IdeasController < ApplicationController

    def new
        @idea = Idea.new
    end


    def create
        @idea = Idea.new idea_params
        # @idea.user = current_user
        if @idea.save
            flash[:notice] = "Idea created."
            redirect_to idea_path(@idea.id)
        else
            render :new
        end
    end

    private

    def idea_params
        params.require(:idea).permit(:title, :body)
    end

    def find_idea
        @idea = Idea.find params[:id]
    end

end
