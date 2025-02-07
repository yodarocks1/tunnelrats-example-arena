# Tunnel Rats Arena Format
## Installing an Arena
1. Add the datapack to your world
    - See the [Minecraft Wiki tutorial](https://minecraft.wiki/w/Tutorial:Installing_a_data_pack) for more information
2. Start the world, or call `/reload`

## Uninstalling an Arena
1. Remove the datapack from your world
    - Either by deleting the file or calling `/datapack disable <datapack_name>`
2. Delete the associated arenas in the level editor

## Creating an Arena
1. Write a function creating your level to the function `tr:data_update/from_datapack`
    - All arguments and parameters are explained in my [example loading script](data/tr/function/downloaded_arenas/yodarocks1/cavey/load.mcfunction)
2. Register your load function by tagging it as #tr:load_arenas
    - See my the [tagging example in this repository](data/tr/tags/function/load_arenas.json)
3. Zip it up (if you like)
    - But only the contents! Don't send the folder to .zip, *just it's contents*
4. Follow the installation instructions above

## Updating an Arena
1. Make sure the version string is different
    - To prevent unnecessary reloading of arenas on every restart, maps will only be updated if:
        1. The namespace-id pair hasn't been seen before
        2. The old version string is different from the new version string
        3. The version string is `dev` (<-- for rapid prototyping)
2. Swap out the datapack
3. Call `/reload`
