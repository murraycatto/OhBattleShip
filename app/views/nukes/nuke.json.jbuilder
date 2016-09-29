if !@nuke.nil?
  json.extract! @nuke, :id, :x, :y, :status
end
