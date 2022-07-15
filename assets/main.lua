window = sfRenderWindow.new(sfVideoMode.new(800,600,32),"Lua SFML Basic Example",sfWindowStyle.Default);

clearColor = sfColor.new(0,0,0);
colorWhite = sfColor.new(255, 255, 255)

font = sfFont.new()
font:loadFromFile("/usr/share/fonts/liberation-fonts/LiberationMono-Regular.ttf")

message = sfText.new("This is Lua SFML!",font,40);
message:setPosition( 200, 250);
message:setColor(colorWhite)

while window:isOpen() do
  event = sfEvent.new();
  while window:pollEvent(event) do
    if(event:type() == sfEventType.Closed) then window:close(); 
    end
  end
  window:clear(clearColor);
  window:draw(message);
  window:display();
end

