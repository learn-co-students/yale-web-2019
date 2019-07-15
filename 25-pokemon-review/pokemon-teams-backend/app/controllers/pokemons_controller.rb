class PokemonsController < ApplicationController
  def create
    # POST /pokemons
    # Body request => { "trainer_id": 10}
    if Trainer.find(params["trainer_id"]).pokemons.length <= 5
    name = Faker::Name.first_name
    species = Faker::Games::Pokemon.name
    pokemon = Pokemon.create(nickname: name, species: species, trainer_id: params["trainer_id"])
    render json: pokemon
    else
      render json: {"error": "TOO MANY POKEMON"}, status: 406
    end
  end

  def destroy
    # DELETE /pokemons/:id
    # /pokemons/117
     pokemon_id = params[:id]
     pokemon = Pokemon.find(pokemon_id)
     pokemon.destroy

     render json: pokemon
  end
end
