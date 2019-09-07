class RestrictionsController < ApplicationController
    def show 
        @restriction = Restriction.find(params[:id])
    end 

    def index
        @restrictions = Restriction.all
    end

    def new
        @restriction = Restriction.new
    end

    def create
        @restriction = Restriction.new(restriction_params)

        if @restriction.save
            redirect_to @restriction
        else 
            render :new 
        end
    end 

    def edit
        @restriction = Restriction.find(params[:id])
    end

    def update
        @restriction = Restriction.find(params[:id])
        if @restriction.update(restriction_params)
            redirect_to restriction_path(@restriction)
        else
            render action :edit
        end
    end 

    def destroy
        @restriction = Restriction.find(params[:id])
        @restriction.destroy
        #binding.pry
        redirect_to restrictions_path
      end
      
    private
        def restriction_params
            params.require(:restriction).permit(:name,
                restrictions_attributes: [
                    :name,
                    :id
                ]
            )
        end
end
