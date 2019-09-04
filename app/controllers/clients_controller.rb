class ClientsController < ApplicationController
    def show 
        @client = Client.find(params[:id])
    end 

    def index
        @clients = Client.all
    end

    def new
        @client = Client.new
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
    end

    def update
        @client = Client.find(params[:id])
        @client.update(client_params)
        redirect_to client_path(@client)
    end 

    def delete
    end 

    private
        def client_params
            params.require(:client).permit(:name)
        end

end
