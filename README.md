# Lua SFML Binding
Binding SFML to LUA

![Lua SFML](./assets/luasfml.jpg) 

---

# Description
LuaSFML is a lua binding of SFML, which let's you use SFML in your lua script.
> This project is a fork of the [original project](https://github.com/Canadadry/luaSFML) which has been stalled for over 9 years and has compilation and other issues.

---

# Dependencies
+ [gcc/g++](https://gcc.gnu.org/)
+ [SFML](https://www.sfml-dev.org/)
+ [Make](https://www.gnu.org/software/make/)
+ [CMake](https://cmake.org/)
+ [Lua 5.1](https://www.lua.org/)

Example on Ubuntu
```bash
sudo apt update
sudo apt install build-essential g++ make cmake lua5.1 liblua5.1-0 liblua5.1-0-dev
```

---

# Building and Instalation

```bash
git clone https://github.com/terroo/luasfml
cd luasfml
mkdir build && cd build
cmake ..
make
sudo make install
```

### Got error ?
```bash
/usr/bin/ld: could not find -llua: No such file or directory
collect2: error: ld returned 1 exit status
make[2]: *** [CMakeFiles/luasfml.dir/build.make:801: luasfml] Erro 1
make[1]: *** [CMakeFiles/Makefile2:84: CMakeFiles/luasfml.dir/all] Erro 2
make: *** [Makefile:136: all] Erro 2
```

To fix it on Ubuntu, run the following command:

```bash
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.1.so /usr/lib/x86_64-linux-gnu/liblua.so
```
> For other systems `find /usr/lib* -name 'liblua5.1.so'` where the file is and create a symlink in the same directory. Or run the command below:
```bash
sudo ln -s $(find /usr/lib* -name 'liblua5.1.so') \
           $(find /usr/lib* -name 'liblua5.1.so' | sed 's/5.1//g')
```

And then run `make` again:

```bash
make
sudo make install
```

---

# Basic Example
Comming soon [Wiki](https://github.com/terroo/luasfml/wiki), In the meantime you can learn by the [Examples/Demos](https://github.com/Canadadry/luaSFML/tree/master/demo) .
> If you already know [SFML with C++](https://www.sfml-dev.org/documentation/2.5.1/) and also know [Lua](https://www.lua.org/docs.html), you will adapt easily. If you want to contribute to the documentation, feel free.

File `main.lua`

```lua
window = sfRenderWindow.new(sfVideoMode.new(800,600,32),"Lua SFML Basic Example",sfWindowStyle.Default);

clearColor = sfColor.new(0,0,0);
colorWhite = sfColor.new(255, 255, 255)

font = sfFont.new()
font:loadFromFile("path/to/font.ttf")

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
```

To run use the `luasfml` command and the name of the *main file* of your project:

```bash
luasfml main.lua
```

This example is available in the [assets](./assets/) directory of that repository. To run:

```bash
cd assets/
luasfml main.lua
```

Possible output:

![Basic Example Lua SFML](./assets/basic-luasfml.jpg) 

---

# Similar Projects
+ [Luna](https://github.com/XyronLabs/Luna)
+ [lsfml](https://github.com/Oberon00/lsfml)
+ [LSFML](https://github.com/ief015/LSFML)

---

# Uninstall
```bash
git clone https://github.com/terroo/luasfml
cd luasfml
mkdir build && cd build
cmake ..
sudo make uninstall
```
