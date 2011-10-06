# Wolfman

*Wolfman* is a HipChat-powered RDIO DJ.

## Using Wolfman

The core capabilities of wolfman are provided by the [robut-rdio](https://github.com/radamant/robut-rdio) gem.  
See that project's README for the most up-to-date list of supported commands.

## Installing Wolfman

**Clone the repo and setup**

```
git clone git@github.com:substantial/wolfman.git
cd wolfman
gem install bundler && bundle
```

**Create your .wolfman file**

Put a `.wolfman` file in the directory to which you cloned wolfman.  It should have the following structure:

```yml
config:
  jid: "NUMBER@chat.hipchat.com"
  password: "password"
  nick: "user nickname"
  room: "NUMBER_ROOMNAME@conf.hipchat.com"
  
rdio:
  key: "YOUR_RDIO_KEY"
  secret: "YOUR_RDIO_SECRET"
```

**Start the Wolfman Robut**

```
 bundle exec robut Chatfile
```

**Open the robut-rdio webpage**

It's normally hosted at: `http://localhost:4567`


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
