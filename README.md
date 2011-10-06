# Wolfman

*Wolfman* is a Hipchat bot that employs the Robut gem to provide functionality to ask about the current playing music and making requests.

## Interacting with Wolfman

### Example

The following is an example conversation in Hipchat with *Wolfman Jack* in the chatroom:

    adam     > @wolfman what's playing?
    wolfman  > Rolling Stones ~ Brown Sugar

    franklin > @wolfman skip this track
    wolfman  > OK

### 

## Running Wolfman

### MPC

*Wolfman* requires that MPC is installed so that it is able to communicate with the system running MPD.

   $ brew install mpc

Configuring the connection information to the host running MPD

   export MPD_HOST=(HOSTNAME or HOSTIP)


### Robut

Create a `.wolfman` or `wolfman.yml` file which contains the following values from Hipchat:

```yml
config:
  jid: "NUMBER@chat.hipchat.com"
  password: "password"
  nick: "user nickname"
  room: "NUMBER_ROOMNAME@conf.hipchat.com"
```

Start the Wolfman Robut

    robut Chatfile


## Extending Wolfman

1. Look at the current extension
2. Copy and create a new one
3. Add the require to the `lib/wolfman.rb`
4. Add the class to the list of behaviors loaded in the `Chatfile`


# Future Notes

## Robut

### Bug Fixes

* Stop Robut from processing all the messages upon entrance

### JobPlugin

Define a plugin that allows for simple offline processing to take place.

## Rdio Plugin

* Ensure strict results
* Remove the preview/sample versions
* Return search results

### Return search results

```
  adam    > @wolfman search Jackson 5
  wolfman > I have 6 results
            1. A B C
            2. ....
            3. ....
 adam     > play track 3
```

## Packaging & Installation

## Just the plugin

  > gem install robut-wolfman
  
## Robut + the Plugin

```
  gem install wolfman
```

This comes with a `wolfman` executable which will interactively let the user set up the parameters for wolfman

```
  $ wolfman
  
    What is your API key ? (url to get it)
    >
    
    What server would you like me to connect to by default?
    >
    
    ...
```