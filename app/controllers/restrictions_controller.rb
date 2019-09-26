class RestrictionsController < ApplicationController
    before_action :require_login

    def show 
        @restriction = Restriction.find(params[:id])
    end 

    def index
        if params[:client_id]
            @restrictions = Client.find(params[:client_id]).restrictions
        else
            @clients = Client.order(:name)
        end
    end

    # def index
    #     @restrictions = Restriction.all
    # end

    def new
        @client = Client.find(params[:client_id])
        @restriction = Restriction.new
    end

    def create
        @client = Client.find(params[:client_id])
        @client.restrictions.build(restriction_params)
        if @client.save
            redirect_to @client
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
        redirect_to restrictions_path
      end
      
    private
        def restriction_params
            params.require(:restriction).permit(:name
                # restrictions_attributes: [
                #     :name,
                #     :id
                # ]
            )
        end

        def require_login
            return head(:forbidden) unless session.include? :user_id
        end
end
