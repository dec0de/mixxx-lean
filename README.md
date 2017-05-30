# (GitHub-Flavored) Markdown Editor

Basic useful feature list:

 * Ctrl+S / Cmd+S to save the file
 * Ctrl+Shift+S / Cmd+Shift+S to choose to save as Markdown or HTML
 * Drag and drop a file into here to load it
 * File contents are saved in the URL so you can share files


mixxx-lean is for when you want to compile and run the latest mixxx in a
docker environment. You will normally run the program with a user having
your username and password. This is achieved by mounting /etc/shadow into
the container. It is also possible to sudo when need be.

This 'lean' version assumes the source code will be in a persistent storage
in a sub directory src to the user. Another option will be to simply
mount an external directory having the source code into the container at run
time, your call...

container at run time and in my docker-compose.yml file I have set aside
a persistent storage for it. Whether you want to copy the src into this
or just keep your source as an externally mounted directory is up to you.
The script also mounts the hosts /home/<user>/Music into its equivalent
position in the container so you will have some music to DJ with.

```
version: '3'
services:
 mixxx:
  build:
   context: .
   args:
   - USR=${HOST_USER}
  image: mixxx-lean
  container_name: mixxx
  privileged: true
  environment:
  - DISPLAY=${DISPLAY}
  - XAUTHORITY=/tmp/.docker.xauth
  - QT_X11_NO_MITSHM=1
  volumes:
  - /home/${HOST_USER}/Music:/home/${HOST_USER}/Music
  - home:/home/${HOST_USER}
  - src:/home/${HOST_USER}/src
  - /tmp/.X11-unix:/tmp/.X11-unix
  - /etc/shadow:/etc/shadow
  - /dev:/dev

volumes: 
 home:
  driver: local
 src:
  driver: local

```

Look, a list!

 * foo
 * bar
 * baz

And here's some code! :+1:

```javascript
$(function(){
  $('div').html('I am a div.');
});
```

This is [on GitHub](https://github.com/jbt/markdown-editor) so let me know if I've b0rked it somewhere.


Props to Mr. Doob and his [code editor](http://mrdoob.com/projects/code-editor/), from which
the inspiration to this, and some handy implementation hints, came.

### Stuff used to make this:

 * [markdown-it](https://github.com/markdown-it/markdown-it) for Markdown parsing
 * [CodeMirror](http://codemirror.net/) for the awesome syntax-highlighted editor
 * [highlight.js](http://softwaremaniacs.org/soft/highlight/en/) for syntax highlighting in output code blocks
 * [js-deflate](https://github.com/dankogai/js-deflate) for gzipping of data to make it fit in URLs
