class ClientsController < ApplicationController
    before_action :require_login
    
    def show 
        @client = Client.find(params[:id])
    end 

    def index
        @clients = Client.order(:name)
    end

    def new
        @client = Client.new
        5.times { @client.restrictions.build }
    end

    def create
        @client = Client.new(client_params)
        if @client.save
            redirect_to @client
        else 
            render :new 
        end
    end 

    def edit
        @client = Client.find(params[:id])
        5.times { @client.restrictions.build }
    end

    def update
        @client = Client.find(params[:id])
        @client.restrictions.delete_all
        if @client.update(client_params)
            redirect_to client_path(@client)
        else
            render :edit
        end
    end 

    def destroy
        @client = Client.find(params[:id])
        @client.destroy
        redirect_to clients_path
      end
      
    private
        def client_params
            params.require(:client).permit(:name, :user_id,
                restrictions_attributes: [
                    :name,
                    :id
                ]
            )
        end

        def require_login
            return head(:forbidden) unless session.include? :user_id
        end
end