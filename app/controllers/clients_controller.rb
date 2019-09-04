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
        @client = Client.create(client_params)
        redirect_to client_path
    end 

    def edit
    end

    def delete
    end 

    private
        def client_params
            params.require[:client].permit[:name]
        end

end
