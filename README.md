# flutter
- Don't use Opacity if can.
Using color: const Color.fromARGB(133, 255, 255, 255) instead of Color.fromARGB(255, 255, 255, 255) 
Opacity: 0 -> 1 Same
         0  -> 255 Same


There are three extremely important (stateful) widget lifecycle methods you should be aware of:

initState(): Executed by Flutter when the StatefulWidget's State object is initialized

build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called

dispose(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally)