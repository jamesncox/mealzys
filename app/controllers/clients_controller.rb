class ClientsController < ApplicationController
    def show 
        @client = Client.find(params[:id])
    end 

    def index
        @clients = Client.all
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
    end

    def update
        @client = Client.find(params[:id])
        @client.update(client_params)
        redirect_to client_path(@client)
    end 

    def destroy
        @client = Client.find(params[:id])
        @client.destroy
        #binding.pry
        redirect_to clients_path
      end
      
    private
        def client_params
            params.require(:client).permit(:name,
                restrictions_attributes: [
                    :name
                ]
            )
        end
end