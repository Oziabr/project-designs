!#/usr/bin/coffee

x = require './markers'
Object.keys(x).forEach (k) ->
  {copyright: copy, imageDate: taken, location: pano: id, shortDescription: descr, latLng: lat: lat, lng: lng} = x[k]
  console.log "insert into geopanpoint values ('#{id}', point(#{lat}, #{lng}), '#{taken}-01', '#{copy}', '#{descr}');"