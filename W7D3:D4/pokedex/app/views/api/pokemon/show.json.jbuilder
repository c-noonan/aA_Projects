json.set! :pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense,
    :poke_type, :moves, :item_ids
  json.image_url asset_path(@pokemon.image_url)
end

json.items do
  @pokemon.items.each do |item|
    json.set! "#{item.id}" do
      json.extract! item, :id, :pokemon_id, :name, :price,
          :happiness
      json.image_url asset_path(item.image_url)
    end
  end
end
