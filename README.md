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
```

**Start the Wolfman Robut**

```
 bundle exec robut Chatfile
```

**Open the robut-rdio webpage**

It's normally hosted at: `http://localhost:4567`


