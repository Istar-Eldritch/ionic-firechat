# ionic-coffee
CoffeeScript blank bootstrap for Ionic Framework

## NPM Scripts

### Install
```
$ npm install
```
Install node depencencies and the executes gulp install task.

### Start
```
$ npm start
```
Equivalent to ionic   `serve --lab`

### Gulp
```
$ npm run-script gulp [params]
```
Runs gulp from local dependencie sin case you don't have gulp installed globally.
You can specify tasks or parameters after the initial command. If you dont specify anything gulp will run the `default` taks, wich is `install`

## Gulp Tasks

### Install
```
$ gulp install
```
Runs bower to download the frontend dependencies. It also executes the `coffee` and `sass` tasks.

### Watch
```
$ gulp watch
```
Runs a watcher over all `.coffee` and `.sass` files and executes the `coffee` and `sass` tasks in response.
