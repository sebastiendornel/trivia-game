const BASE_URL = "http://localhost:3000"
const TRAINERS_URL = `${BASE_URL}/trainers`
const POKEMONS_URL = `${BASE_URL}/pokemons`

document.addEventListener("DOMContentLoaded", () => {
    fetchTrainers()
})

function fetchTrainers(){
    fetch(TRAINERS_URL)
    .then(resp => resp.json())
    .then(trainerArr => trainerArr.forEach(renderTrainers))
}

function renderTrainers(trainer){
    const container = document.querySelector("main"),
      div = document.createElement("div"),
      p = document.createElement("p"),
      button = document.createElement("button"),
      ul = document.createElement("ul")
      div.className = "card"
      div.setAttribute('data-id', `${trainer.id}`)
      p.innerText = trainer.name
      button.setAttribute('data-trainer-id', `${trainer.id}`)
      button.innerText = "Add Pokemon"
      container.appendChild(div)
      div.append(p, button, ul)

      trainer.pokemons.forEach(pokemon => renderPokemons(pokemon, ul))

      button.onclick = () => addPokemon(event)
}

function renderPokemons(pokemon, ul){
  const li = document.createElement('li'),
            button = document.createElement('button')
       li.innerText = `${pokemon.nickname} (${pokemon.species})`
       button.className = "release"
       button.innerText = "release"
       button.setAttribute('data-pokemon-id', `${pokemon.id}`)
       li.appendChild(button)
       ul.appendChild(li)

  button.addEventListener("click", deletePokemon)
}

function addPokemon(event){
  const id = event.target.dataset.trainerId
  fetch(TRAINERS_URL + `/${id}`)
  .then(resp => resp.json())
  .then(trainer => addPokemon2(event, trainer))
}

function addPokemon2(event, trainer){
  if (trainer.pokemons.length < 6){
    const newPokemon = {
      trainer_id: trainer.id
    }
    fetch(POKEMONS_URL, {
      method: "POST",
      headers: {"Content-type": "application/json", 
      "Accept": "application/json"},
      body: JSON.stringify(newPokemon)
    
    })
    .then(resp => resp.json())
    .then(pokemon => { 
      const ul = event.target.nextElementSibling
      renderPokemons(pokemon,ul)
    } )
  } else {
    console.log("nope")
  }
}


function deletePokemon(){

  pokemon = event.target.dataset.pokemonId
    const toDelete = {
      id: pokemon
    }
    fetch(POKEMONS_URL + `/${parseInt(pokemon)}`, {
      method: "DELETE",
      headers: {"Content-type": "application/json", 
      "Accept": "application/json"},
      body: JSON.stringify(toDelete)
    
    })
    event.target.parentNode.remove()
  }